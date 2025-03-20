#bin/bash
for subject in $(curl -s -X GET http://localhost:8081/subjects | jq -r '.[]'); do
    curl -X DELETE "http://localhost:8081/subjects/$subject"
done
