
### Project Approach for a Periodic Table Database

#### 1. **Project Overview**
   - **Objective**: Create a database of chemical elements with functionalities to query and display information based on atomic number, symbol, or name.
   - **Technology Stack**:
     - PostgreSQL for the database
     - Bash scripting for querying the database
     - Git for version control

#### 2. **Database Design**
   - **Tables**:
     - `elements`: Store information about each element (atomic number, name, symbol, atomic mass).
     - `properties`: Store properties of each element (melting point, boiling point, type).
     - `types`: Categorize elements into types (metal, nonmetal, metalloid).
   
   - **Relationships**:
     - Foreign key relationship between `properties` and `elements` on `atomic_number`.
     - Foreign key relationship between `properties` and `types` on `type_id`.

#### 3. **Database Setup**
   - **Fixing the Database**:
     - Rename columns and add constraints as per user stories.
     - Populate the `types` table with predefined element types.
     - Ensure all fields that should not accept null values are enforced.
     - Remove any trailing zeros from decimal values in the `atomic_mass` column.

#### 4. **Script Development**
   - **Bash Script (`element.sh`)**:
     - Create a script that accepts an atomic number, symbol, or name as input.
     - Query the database to retrieve information about the specified element.
     - Handle errors for invalid inputs gracefully.
     - Ensure the script outputs the information in a user-friendly format.

#### 5. **Version Control**
   - **Using Git**:
     - Initialize a Git repository for version control.
     - Commit changes regularly with meaningful messages to track progress.
     - Ensure the project is in a clean state before pushing to a remote repository.

#### 6. **Testing**
   - Test all functionalities of the Bash script.
   - Ensure all database constraints and relationships are working as intended.
   - Verify that all user stories are implemented and functional.

#### 7. **Documentation**
   - Create a README file detailing the project structure, setup instructions, and usage.


## Script Usage
To query information about an element, run the script with one of the following arguments:
- Atomic number (e.g., `./element.sh 1`)
- Symbol (e.g., `./element.sh H`)
- Name (e.g., `./element.sh Hydrogen`)

### Example Commands
```bash
./element.sh 1
# Output: The element with atomic number 1 is Hydrogen (H). It's a nonmetal, with a mass of 1.008 amu. Hydrogen has a melting point of -259.1 celsius and a boiling point of -252.9 celsius.

./element.sh He
# Output: The element with atomic number 2 is Helium (He). It's a nonmetal, with a mass of 4.002602 amu. Helium has a melting point of -272.2 celsius and a boiling point of -268.9 celsius.
```

## Testing
- Verify that the database is set up correctly by running SQL queries to ensure all data is accurate.
- Test the `element.sh` script with various valid and invalid inputs to confirm proper error handling.



## License
This project is licensed under the MIT License. See the [LICENSE](LICENSE) file for details.


