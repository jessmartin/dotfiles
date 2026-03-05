Generate Jess's daily status update for #proj-aiops by gathering context from Slack, Linear, and Notion, then creating any missing tickets before writing the final update.

## Step 1: Load yesterday's plan

Find and read the most recent file in `~/.claude/daily-updates/` to see what was planned. Compare against what actually got done.

## Step 2: Gather data (run in parallel for speed)

Use these MCP tools simultaneously:

**Slack — read key channels (last 24h):**
Calculate `oldest` as a Unix timestamp for 24 hours ago from now.
- `slack_read_channel` for #human-jess (channel_id: `C084ANX70A1`, oldest: <24h ago>)
- `slack_read_channel` for #proj-aiops (channel_id: `C0A1QJG57S9`, oldest: <24h ago>)
- `slack_search_public` with query `from:<@U0852CJ7Q2U>` and `sort: timestamp` to find ALL messages I sent across all channels and DMs in the last 24h
- For any messages with thread replies, use `slack_read_thread` to get full context

**Linear — my active work:**
- `list_issues` assigned to `me` in project `Automate Elicit` with state `started` (In Progress)
- `list_issues` assigned to `me` in project `Automate Elicit` with state `unstarted` (Todo)
- `list_issues` assigned to `me` in project `Automate Elicit` with state `completed` and updatedAt in last 24h

**Notion — my recent edits:**
- `notion-search` for pages I recently edited (filter by created_by or last_edited if possible)

## Step 3: Propose new tickets FIRST

Before writing the update, identify work from Slack/Notion conversations that isn't tracked in Linear yet. For each proposed ticket:
- Present it clearly: **Title** — description, suggested priority, labels
- Ask me if I want to create it, and what state it should be in (Done, In Progress, Todo)
- If I say yes, use `save_issue` with team=Elicit, project=Automate Elicit, assignee=me
- If the work is already done, also update the issue status to completed

Wait for my responses before proceeding to Step 4.

## Step 4: Write the update

Now that all work is tracked in Linear, synthesize everything into this format:

```
*Done* (since last update)
• description ([ELI-XXXXX](linear-url))
• description ([ELI-XXXXX](linear-url))

*Today*
• description ([ELI-XXXXX](linear-url))
• description ([ELI-XXXXX](linear-url))

*Didn't get to* (from yesterday's plan)
• description ([ELI-XXXXX](linear-url))
```

Every item should reference a Linear ticket with a link. Use Slack mrkdwn format (single `*` for bold, `<url|text>` for links).

## Step 5: Save today's plan

Write today's "Today" items to `~/.claude/daily-updates/YYYY-MM-DD.md` (using today's date) so tomorrow's run can diff against it. Format:

```markdown
# Daily Plan - YYYY-MM-DD

## Today
- [ELI-XXXXX](url) — description
- [ELI-XXXXX](url) — description
```

## Step 6: Offer clipboard

Remind me I can run `/copy` then `/slackcopy` to get it formatted for Slack.
