#!/bin/bash
PSQL="psql --username=freecodecamp --dbname=periodic_table -t --no-align -c"

if [[ -z $1 ]]
then
  echo "Please provide an element as an argument."
  exit
fi

# Check if the input is a number (to search by atomic number)
if [[ $1 =~ ^[0-9]+$ ]]; then
    QUERY="WHERE e.atomic_number = $1"
else
    QUERY="WHERE e.symbol = '$1' OR e.name ILIKE '$1'"
fi

ELEMENT_DATA=$($PSQL "SELECT e.atomic_number, e.name, e.symbol, p.atomic_mass, p.melting_point_celsius, p.boiling_point_celsius, t.type
                       FROM elements e
                       JOIN properties p ON e.atomic_number = p.atomic_number
                       JOIN types t ON p.type_id = t.type_id
                       $QUERY;")

if [[ -z $ELEMENT_DATA ]]; then
    echo "I could not find that element in the database."
else
    # Read the output and format it
    echo "$ELEMENT_DATA" | while IFS="|" read -r ATOMIC_NUMBER NAME SYMBOL ATOMIC_MASS MELTING_POINT BOILING_POINT TYPE; do
        echo "The element with atomic number $ATOMIC_NUMBER is $NAME ($SYMBOL). It's a $TYPE, with a mass of $ATOMIC_MASS amu. $NAME has a melting point of $MELTING_POINT celsius and a boiling point of $BOILING_POINT celsius."
    done
fi