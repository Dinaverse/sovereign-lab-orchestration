# 🏛️ BLUEPRINT : INFRASTRUCTURE NGC AVANCÉE (DEEPSTREAM, TAO, RIVA & RAG)

Ce document contient les plans de déploiement pour les ressources critiques d'NVIDIA sur votre cluster Arch et votre station Kali.

---

## 1. 👁️ ANALYSE VIDÉO : DEEPSTREAM SDK
*Cible : Cluster Arch (Multi-GPU) ou Kali (Analyse locale).*
DeepStream permet de traiter des flux vidéo en temps réel sur vos cœurs CUDA.

**Commande de déploiement (Docker) :**
```bash
docker run --gpus all -it --rm \
  -v /tmp/.X11-unix:/tmp/.X11-unix \
  -e DISPLAY=$DISPLAY \
  -v /mnt/verbatim:/mnt/verbatim \
  nvcr.io/nvidia/deepstream:6.2-triton
```
*Usage : Détection d'objets sur flux RTSP ou fichiers .mp4 avec accélération matérielle.*

---

## 2. 🧠 FINE-TUNING : TAO TOOLKIT
*Cible : Station Kali (64 Go RAM / 40 Threads).*
TAO permet d'adapter des modèles IA pré-entraînés à votre environnement spécifique.

**Installation du CLI TAO :**
```bash
# Nécessite un environnement virtuel
python3 -m venv ~/tao_env
source ~/tao_env/bin/activate
pip install nvidia-tao
```
**Lancement du container d'entraînement :**
```bash
docker run --gpus all -it --rm \
  -v /mnt/verbatim/data:/data \
  -v /mnt/verbatim/specs:/specs \
  nvcr.io/nvidia/tao/tao-toolkit:5.0.0-py3
```

---

## 3. 🎙️ INTERFACE VOCALE : NVIDIA RIVA
*Cible : Station Kali (Développement).*
Transformez votre lab en centre de commande vocal (STT/TTS).

**Initialisation (Quick Start) :**
```bash
# Téléchargement des scripts de déploiement
ngc registry resource download-version "nvidia/riva/riva_quickstart:2.11.0"
cd riva_quickstart_v2.11.0
# Modifiez config.sh pour activer les services souhaités
bash riva_init.sh
bash riva_start.sh
```

---

## 🛡️ 4. STRATÉGIE RAG (RETRIEVAL-AUGMENTED GENERATION)
*Cible : Cerveau du Lab (Arch Linux + Disque Verbatim).*
Le but est de lier votre modèle Qwen 3.5:27B à votre documentation locale.

**Architecture Proposée :**
1. **Base de données Vectorielle (Milvus ou ChromaDB) :** Stockée sur le disque Verbatim.
2. **Embeddings (Modèle NVIDIA NeMo) :** Transforme vos fichiers .md en vecteurs numériques.
3. **Orchestration (LangChain/LlamaIndex) :** Fait le pont entre vos questions et les documents trouvés.

**Avantage :** Vous pourrez demander à votre IA : *"Comment ai-je configuré mes P106-100 en mai 2026 ?"* et elle répondra en lisant vos propres fichiers.

---

## 📁 RÉCAPITULATIF DES VOLUMES SUR VERBATIM
Pour que tout soit persistant, utilisez cette structure :
* `/mnt/verbatim/models/` : Stockage des modèles TAO et Riva.
* `/mnt/verbatim/data/` : Flux vidéo pour DeepStream et datasets.
* `/mnt/verbatim/vector_db/` : Index pour votre système RAG.

---
*Généré le 21 Mai 2026 - Master Plan de Labo Souverain.*

## 5. OPTIMISATION HAUTE PERFORMANCE : TENSORRT-LLM
*Cible : Cluster Arch (4x P106-100)*
TensorRT-LLM est le compilateur d'inférence de référence pour extraire la vitesse maximale de vos GPUs.

### Procédure d'implémentation :
1. **Container de compilation :**
   Utilisez le conteneur officiel pour convertir vos modèles en format engine :
   docker run --rm -it --gpus all \
     -v /mnt/verbatim/models:/models \
     nvcr.io/nvidia/tensorrt-llm:latest

2. **Compilation du modèle (Exemple pour Qwen) :**
   python3 /app/tensorrt_llm/examples/qwen/build.py \
     --model_dir /models/qwen27b \
     --output_dir /models/qwen27b_trt \
     --dtype float16 \
     --tp_size 4
   *Note: --tp_size 4 (Tensor Parallelism) répartit automatiquement le modèle sur vos 4 GPUs P106-100.*

3. **Inférence :**
   Utilisez le runtime TensorRT-LLM directement pour des vitesses d'inférence multipliées par 2 ou 3 par rapport à Ollama/PyTorch classique.
