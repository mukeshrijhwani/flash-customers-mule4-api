value=($(<env.txt))

for i in "${value[@]}"
do
  key=$(echo $i | cut -f1 -d=)
  val=$(echo $i | cut -f2 -d=)
  echo " $key and $val "

  if test -z "$key"
  then
    echo ""
  elif [[ "$key" =~ ^\# ]]
  then
    echo ""
  elif [ "$key" = "GIT_TYPE" ] 
  then
    GIT_TYPE=$val
  elif [ "$key" = "GIT_USER" ] 
  then
    GIT_USER=$val
  elif [ "$key" = "GIT_PROJECT" ] 
  then
    GIT_PROJECT=$val
  elif [ "$key" = "CIRCLECI_TOKEN" ] 
  then
    CIRCLECI_TOKEN=$val
  else
  #curl -X POST --header "Content-Type: application/json" -d "{\"name\":\"$key\", \"value\":\"$val\"}" https://circleci.com/api/v1.1/project/$GIT_TYPE/$GIT_USER/$GIT_PROJECT/envvar?circle-token=$CIRCLECI_TOKEN
  echo "calling" 
  fi
done
