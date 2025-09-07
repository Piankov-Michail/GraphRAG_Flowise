# GraphRAG_Project
## Installation
### Auto
```bash
chmod +x run_services.sh
./run_services.sh
```
<br>

### Manual
#### 1) Clone all repositories into your directory
```bash 
git clone https://github.com/Piankov-Michail/Flowise_for_GraphRAG.git
```
```bash 
git clone https://github.com/Piankov-Michail/cognee_for_GraphRAG.git
```

#### 2) Cognee service
```bash 
cd cognee_for_GraphRAG/
cp .env.template .env

docker compose --profile neo4j --profile mcp up -d
```

#### 3) Flowise service
```bash 
cd ../Flowise_for_GraphRAG/docker/
cp .env.example .env

docker compose up -d
```

#### 4) Ollama service
```bash
cd ../..

docker run -d --network=cognee-network --gpus=all -v ollama:/root/.ollama --name ollama ollama/ollama
docker exec -it -d ollama ollama run qwen3:4b-instruct-2507-q4_K_M
docker exec -it -d ollama ollama run dengcao/Qwen3-Embedding-4B:Q4_K_M
```

#### 5) Open Flowise on `http://localhost:3000/` <br> <br>
#### 6) Load this [Agentflow](https://github.com/Piankov-Michail/GraphRAG_Flowise/blob/6b990d15b47b869256466d47c89f7205c49ffa6a/GraphRAG%20Agents.json) to Flowise <br> <br>
#### 7) To see knowledge graph in neo4j open `http://localhost:7474/` <br> <br>
<br>

## Example
```text
Me:

cognify:
My name is Alex. I live in a small town with my family and many friends. My mother, Sarah, is a doctor, and my father, Mark, is a teacher at the local high school.
He is also the coach of the soccer team. My younger sister, Emma, is a student at that same high school.
She is best friends with Chloe, who lives next door to us. Chloe’s parents are David and Linda. David is my father’s colleague; they both teach history.
```
```text
AI: 

I've received your information about your family and friends, and I've initiated the process to structure this knowledge into a knowledge graph.
To ensure we can properly analyze and connect this information, I'll now check the status of the cognify process to confirm it's running correctly and to verify that the data has been successfully processed into a structured knowledge graph.Would you like me to proceed with this check, or would you prefer to explore any specific aspects of this information first?
```
<br> <br>
### neo4j results:
<img width="1515" height="500" alt="{D0D29970-1FE0-4CBB-BFFB-99451E794B17}" src="https://github.com/user-attachments/assets/e06139cb-2c5c-42c9-9c9f-7362717d0d7b" />

### [log](https://github.com/Piankov-Michail/GraphRAG_Flowise/blob/main/log.txt)
<br> <br>
## Resources
### [Flowise](https://github.com/FlowiseAI/Flowise)
### [Cognee](https://github.com/topoteretes/cognee)
### [Ollama](https://hub.docker.com/r/ollama/ollama)
