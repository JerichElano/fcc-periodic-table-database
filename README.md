# 🧪 Periodic Table Database

An interactive Bash command-line utility powered by a PostgreSQL database, built as part of the **freeCodeCamp Relational Database Certification**.

---

## 🔬 About the Project

The core objective of this project was to design, clean, and query a relational database containing chemical elements, and build an interactive Bash script (`element.sh`) that dynamically retrieves and formats element details based on user input. 

Whether a user inputs an atomic number (e.g., `1`), a chemical symbol (e.g., `H`), or a full element name (e.g., `Hydrogen`), the script instantly parses the database and outputs precise properties like its type, atomic mass, melting point, and boiling point.

---

## 🚀 Key Files

* **`element.sh`** - The core Bash script that handles user arguments, queries the PostgreSQL database using SQL logic, and formats the output string.
* **`periodic_table.sql`** - The complete PostgreSQL database dump containing the cleaned schema, properties, and types tables.

---

## 💡 Technical Highlights & Implementation

* **Flexible Multi-Type Input Matching:** Used standard SQL type casting (`CAST(atomic_number AS TEXT)`) alongside case-insensitive pattern matching (`ILIKE`) to seamlessly accept numbers, symbols, or strings in a single query.
* **Relational Database Design:** Joined three tables (`types`, `properties`, and `elements`) using clean table joins (`USING(type_id)` and `USING(atomic_number)`).
* **Data Cleanup:** Standardized database records by capitalizing element symbols and stripping trailing zeros from floating-point values using real-number casting (`::REAL`).
* **Professional Version Control:** Managed the repository following **Conventional Commits** standards (`feat:`, `refactor:`, `test:`) and proper branch structures (`main`).

---

## 🛠️ Challenge Overcome During Development

1. **Handling Multi-Type Arguments (`CAST` function):**
   * *Challenge:* Allowing the script to take a mix of numbers (`1`) and text (`H`, `Hydrogen`) without causing PostgreSQL data-type mismatch crashes.
   * *Solution:* Cast the numeric column to text explicitly within the SQL query (`WHERE CAST(atomic_number AS TEXT) = '$1'`) so it could safely evaluate string comparisons across different data types.
     
