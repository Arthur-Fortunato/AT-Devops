# Ufology Investigation Unit - DevOps Setup

Este projeto demonstra a implementação completa de uma arquitetura baseada em containers e Kubernetes, incluindo banco de dados, cache, aplicação backend e pipelines de CI/CD.

---

# Arquitetura

Composta por:

* 🐘 **PostgreSQL**
* ⚡ **Redis**
* ☕ **Spring Boot**
* ☸️ **Kubernetes**
* 🔄 **GitHub Actions**

---

# Infraestrutura Kubernetes

Todos os recursos foram criados dentro do namespace **ufology**

## Componentes

### 🐘 PostgreSQL

* Deployment com 1 réplica
* ClusterIP
* Variáveis:
    * `POSTGRES_USER`
    * `POSTGRES_PASSWORD`
    * `POSTGRES_DB`

---

### ⚡ Redis

* Deployment com 1 réplica
* Imagem leve (`redis:alpine`)
* Service interno (`ClusterIP`)
* Porta: `6379`

---

### ☕ Aplicação (UFO Tracker)

* Deployment com **2 réplicas**
* Imagem Docker personalizada publicada no Docker Hub
* Porta: `8080`
* ClusterIP

---

# Algumas configurações

## ConfigMap

Usado para armazenar dados não sensíveis:

```
DB_NAME=ufology
```

---

## Secret

Utilizado para armazenar dados sensíveis:

```
DB_PASSWORD=*****
```

---

# 🐳 Docker

A aplicação foi dockerizada usando **multi-stage build**:

* Stage 1: Build com Maven + Java 21
* Stage 2: Runtime com JRE 21

---

# 🔄 CI/CD (GitHub Actions)

## Workflows implementados

### hello.yml

* Executa em qualquer push
* Exibe: `Hello CI/CD`

---

### tests.yml

* Executa em `pull_request`
* Simula execução de testes

---

### gradle-ci.yml (Maven)

* Executa em push na branch `main`
* Realiza o build da aplicação

---

### env-demo.yml

* Demonstra uso de variável de ambiente

---

### secret-demo.yml

* Demonstra uso de secrets sem expor valores

---

# Resultado

Ao final, foi construída uma arquitetura completa contendo:

* Banco de dados
* Cache
* Aplicação distribuída
* Pipeline de integração contínua