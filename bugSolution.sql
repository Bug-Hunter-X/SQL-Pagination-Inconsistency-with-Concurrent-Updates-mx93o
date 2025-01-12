Several approaches can improve consistency: 

1. **Using Row Numbers with a Window Function:** Assign a unique row number to each record before applying `LIMIT` and `OFFSET`. This is less susceptible to changes in the underlying data. 
```sql
SELECT * FROM (
    SELECT *, ROW_NUMBER() OVER (ORDER BY id) as rn FROM your_table
) as ranked_data WHERE rn BETWEEN 11 AND 20; -- For page 2
```

2. **Unique Identifiers and Filtering:** If you have a unique identifier column (like an auto-incrementing ID), use that to determine the paging boundary. This will guarantee retrieving the same page of data even after updates. 

3. **Using Cursors (Less Efficient):** Cursors offer a less common but still relevant method to retrieve paginated data. Cursors provide a more stable way to move through the record set, as they operate on the record set directly instead of by row number. 

The choice depends on the specific database system and performance requirements.