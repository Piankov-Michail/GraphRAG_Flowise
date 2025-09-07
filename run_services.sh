git clone https://github.com/Piankov-Michail/Flowise_for_GraphRAG.git
git clone https://github.com/Piankov-Michail/cognee_for_GraphRAG.git

cd cognee_for_GraphRAG/
cp .env.template .env

docker compose --profile neo4j --profile mcp up -d

cd ../Flowise_for_GraphRAG/docker/
cp .env.example .env

docker compose up -d

cd ../..

docker run -d --network=cognee-network --gpus=all -v ollama:/root/.ollama --name ollama ollama/ollama
docker exec -it -d ollama ollama run qwen3:4b-instruct-2507-q4_K_M
docker exec -it -d ollama ollama run dengcao/Qwen3-Embedding-4B:Q4_K_M