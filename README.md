# Activity 07 — Subqueries and Nested Queries (Sales Analytics)

> **🛠️ Stack for this lesson** — SQLite via DB Browser for SQLite (3.25+ for window functions). Docker `mysql:8.0` + `postgres:15` shipped optionally.
> 📥 Template: [/learn/w4/template/activity-07-subqueries-nested-queries](/learn/w4/template/activity-07-subqueries-nested-queries)

A 4-table sales schema (`customers`, `products`, `orders`, `order_items`) seeded with 30 customers, 40 products, 80 orders, 200+ line items. You'll exercise scalar subqueries, correlated subqueries, derived tables, CTEs, and views — the toolkit real reporting queries are built from.

**Time:** ~60 minutes · **Concept:** Concept 07 — Subqueries and Nested Queries

---

## What You'll Build

| # | TODO | Where |
|---|------|-------|
| 1 | Customers whose total completed-order spend is greater than the average completed-order spend across all customers. Output: customer_name, email, total_spent, avg_order_value. | `sqlite/queries.sql` |
| 2 | Product revenue ranking — every product 1–40 ranked by revenue (`SUM(quantity * unit_price)` from completed orders), zero-revenue products included. | `sqlite/queries.sql` |
| 3 | A `sales_dashboard` view that joins customers, orders, products, order_items for completed orders only, exposing customer info, order info, line totals. | `sqlite/queries.sql` |

## Run It

### SQLite

1. Open DB Browser. **File → New Database** → `sales.db`.
2. Run `sqlite/schema.sql`, then `sample-data.sql`.
3. Open `sqlite/queries.sql` — run queries 1–7 to see the patterns. Then write 8–10.

### Docker (optional)

```bash
docker-compose up -d
docker exec -it w4-mysql mysql -u root -plearning123 contacts_db
# or
docker exec -it w4-postgres psql -U postgres contacts_db
```

## Verify

- [ ] TODO 1: every output customer's `total_spent` exceeds the global completed-order average; only `status='completed'` orders contribute.
- [ ] TODO 2: row count = 40; products with no sales appear with revenue 0.00; revenue is rounded to 2 dp.
- [ ] TODO 3: `SELECT COUNT(*) FROM sales_dashboard;` returns 150+ rows; every row has `o.status='completed'`.

## Stretch

- A NOT EXISTS query: products that have never been ordered.
- A monthly revenue report using `EXTRACT(MONTH FROM order_date)` (or `strftime('%m', ...)` in SQLite).
- A customer cohort analysis: group customers by registration month and show retention.

## 🪞 Reflect on Your Work

Answer in 2-3 sentences each, in this README under your TODO commits. Your tutor reads these as part of grading.

1. **What did you learn that you didn't know before?** Pick the most surprising thing — when a correlated subquery is unavoidable, why a CTE can be clearer than nesting, or how a view differs from a CTE.
2. **How did you collaborate with AI?** If you used Claude / ChatGPT / Cursor / Copilot, what part of the work did *you* contribute — the prompt, the verification, the design decision, the bug-fix? If you didn't use AI, what was hardest to figure out alone?
3. **How do you know your code works?** Describe one specific thing you did to confirm — a row count, a manual check on the average, a screenshot of the result.

> AI is a great collaborator. Owning your thinking, verifying the output, and explaining your design choices is what *learning* looks like in this course.

## Submit

When the Verify checklist is green, head to **[/learn/w4/certification](/learn/w4/certification)** and submit your `queries.sql` link.

<!-- claude-template-fix: readme-v3 -->
