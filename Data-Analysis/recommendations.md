# Performance Improvement Recommendations
1. Creating an index to group common attributes together is one way to improve the performance of the workload.
   * The index could be defined by the SIN attribute, which is incorporated in several relations throughout this database.
   * It could be an ascending index, which means the SIN values would be listed in order from greatest to smallest.
   * This would help with the query in question 5b), which asks for a list of attributes associated with each driver’s driving infractions. To complete this query, it is necessary to group the relevant data according to each driver. This is when the index would be beneficial, as the data in the “Infraction” relation would already be grouped by each driver’s SIN.

2. Create an index for large tables.
   * The index would be defined on the ArrivalTime attribute in the Schedule table, as it contains a lot 14783 records.
   * The index that would be used is a clustered index, as clustered indexes are often used to improve performance with large tables.
   * Clustered indexes are used for queries with a range of values. This could be useful for question 12, as it asks to return the arrival times between 4:20 pm and 4:50 pm that meet the other conditions.

3. Creating an index to sort attributes according to a specific criteria is another way in which to improve the performance.
   * This index can be used on Salary or YearsOfService in the Driver relation.
   * It could be an ascending or descending index.
   * This index can be used for the query in question 10, which asks to return information about drivers who have worked for over 5 years and have salaries greater than $80000. With the use of this ascending or descending index, you can optimize search for drivers who meet than qualification, as the data will be organized according the salary amount or the years of service.

4. A unique index can be used for relations with foreign keys that have unique values.
