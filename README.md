# GraphRAG_Flowise

## 1) Clone all repositories into your directory
### `git clone https://github.com/Piankov-Michail/Flowise.git`
### `git clone https://github.com/Piankov-Michail/cognee.git`
### <br> <br>
## 2) Cognee service
### `cd cognee/` <br> `cp .env.template .env` 
### `docker compose --profile neo4j --profile cognee-mcp up -d`
### <br> <br>
## 3) Flowise service
### `cd ../Flowise/docker/` <br> `cp .env.example .env`
### `docker compose up -d`
### <br> <br>
## 4) Ollama service
### `cd ../..` <br> 
### `docker run -d --network=cognee-network --gpus=all -v ollama:/root/.ollama --name ollama ollama/ollama`
### `docker exec -it -d ollama ollama run qwen3:4b-instruct-2507-q4_K_M`
### `docker exec -it -d ollama ollama run dengcao/Qwen3-Embedding-4B:Q4_K_M`
### <br> <br>
## 5) Open Flowise on `http://localhost:3000/` <br> <br>
## 6) Load this [Chatflow](https://github.com/Piankov-Michail/GraphRAG_Flowise/blob/6b990d15b47b869256466d47c89f7205c49ffa6a/GraphRAG%20Agents.json) to Flowise <br> <br>
## 7) To see kowledge graph in neo4j open `http://localhost:7474/` <br> <br>
