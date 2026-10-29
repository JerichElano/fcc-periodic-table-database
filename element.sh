#! /bin/bash

PSQL="psql --username=freecodecamp --dbname=periodic_table -t --no-align -c"

if [[ -z $1 ]]
then
  echo "Please provide an element as an argument."
else
  # Checks if user input exist in the database
  QUERY_RESULT=$($PSQL "SELECT * FROM types INNER JOIN properties USING(type_id) INNER JOIN elements USING(atomic_number) WHERE symbol ILIKE '$1' OR name ILIKE '$1' OR CAST(atomic_number AS TEXT) = '$1'")
  if [[ -z $QUERY_RESULT ]]
  then
    # No result
    echo "I could not find that element in the database."
  else
    # Displays the result
    echo $QUERY_RESULT | while IFS="|" read ATOMIC_NUMBER TYPE_ID TYPE ATOMIC_MASS MELTING_POINT BOILING_POINT SYMBOL NAME
    do
      echo "The element with atomic number $ATOMIC_NUMBER is $NAME ($SYMBOL). It's a $TYPE, with a mass of $ATOMIC_MASS amu. $NAME has a melting point of $MELTING_POINT celsius and a boiling point of $BOILING_POINT celsius."
    done
  fi
fi
