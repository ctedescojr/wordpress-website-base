<div align="center">
  <a href="#português">Português</a>
  <span>&nbsp;&nbsp;•&nbsp;&nbsp;</span>
  <a href="#english">English</a>
</div>

<a name="português"></a>

# Base de Desenvolvimento WordPress Multiplataforma (Windows & Linux)

<div align="center">

<br>

_Um ambiente de desenvolvimento WordPress completo e multiplataforma (Windows e Linux), construído com Docker._

</div>

## 📖 Sobre o Projeto

<div align="justify">
Este projeto fornece uma **base de desenvolvimento WordPress** multiplataforma. Ele foi projetado para ser um ponto de partida rápido e eficiente para qualquer projeto WordPress, permitindo que desenvolvedores iniciem rapidamente, sem se preocupar com a configuração do ambiente, seja em Windows ou Linux.
</div>
<div align="justify">
Construído sobre uma base robusta de WordPress, o projeto utiliza um ambiente de desenvolvimento moderno com Docker para garantir consistência, segurança e facilidade de manutenção em diferentes sistemas operacionais.
</div>

## ✨ Principais Funcionalidades

- 🐳 **Ambiente de Desenvolvimento Moderno:** O projeto é totalmente containerizado com Docker, permitindo que qualquer desenvolvedor inicie o ambiente completo com um único comando.
- 🔧 **Configuração Simplificada:** Scripts automatizados para configuração e inicialização do ambiente, com suporte para Windows (PowerShell) e Linux (Bash).
- 📊 **Ferramentas de Desenvolvimento:** Inclui phpMyAdmin para gerenciamento de banco de dados e MailHog para testes de email.
- 🔄 **Sincronização de Arquivos:** Volumes Docker configurados para sincronizar alterações em tempo real entre o sistema host (Windows/Linux) e os containers.
- 🛡️ **Segurança Integrada:** Configurações otimizadas para desenvolvimento seguro.
- 🚀 **Performance Otimizada:** Configurações de MySQL e PHP ajustadas para melhor desempenho em ambiente de desenvolvimento.

## 🚀 Tecnologias, Ferramentas e Segurança

Um resumo das tecnologias utilizadas para construir, manter e proteger a plataforma.

| Plataforma Principal | Ambiente de Desenvolvimento            | Ferramentas & Segurança                                             |
| :------------------- | :------------------------------------- | :------------------------------------------------------------------ |
| WordPress            | Docker & Docker Compose                | Compatibilidade Windows & Linux                                     |
| Tema Padrão          | **WP-CLI** (Linha de Comando)          | Configuração otimizada para múltiplos ambientes                     |
| -                    | **MailHog** (Servidor de E-mail Local) | Criptografia **SSL/HTTPS** para todas as conexões                   |
| -                    | **phpMyAdmin** (Gerenciador de BD)     | Código-base seguindo as melhores práticas de segurança do WordPress |

## 🏁 Como Começar

Para obter uma cópia local e colocá-la em funcionamento, siga estes passos simples.

### Compatibilidade com Windows e Linux

Este projeto foi especialmente adaptado para funcionar em ambientes Windows e Linux. Ele inclui:

- Scripts PowerShell (.ps1) para configuração e backup no Windows
- Scripts Bash (.sh) para configuração e backup no Linux
- Configurações de Docker otimizadas para ambos os ambientes
- Mapeamento de portas configurável via variáveis de ambiente
- Instruções específicas para cada ambiente

### Pré-requisitos

- Docker
- Docker Compose

### Instalação

1.  **Clone o repositório**

    ```sh
    git clone [URL_DO_SEU_REPOSITORIO_GIT]
    cd nome-do-projeto
    ```

2.  **Configure a Estrutura do Projeto**
    Você pode usar os scripts para criar a estrutura básica do projeto, incluindo pastas e arquivos de configuração.

    No Windows:

    ```powershell
    ./scripts/create-structure.ps1
    ```

    No Linux:

    ```sh
    chmod +x scripts/create-structure.sh
    ./scripts/create-structure.sh
    ```

    Isso criará a estrutura básica e copiará o arquivo `.env.example` para `.env`. Edite o arquivo `.env` com suas senhas seguras.

3.  **Execute o Script de Instalação**
    Este script automatiza toda a configuração do ambiente, incluindo a instalação do WordPress e dos plugins essenciais.

    No Windows:

    ```powershell
    # No Windows, use o script PowerShell
    ./scripts/setup.ps1
    ```

    No Linux:

    ```sh
    # Dê permissão de execução ao script (apenas na primeira vez)
    chmod +x scripts/setup.sh

    # Rode o script
    ./scripts/setup.sh
    ```

4.  **Acesse a Plataforma**
    Após a conclusão do script, seu ambiente estará pronto:

    - **Site WordPress:** `http://localhost:8080`
    - **phpMyAdmin:** `http://localhost:8081`
    - **MailHog:** `http://localhost:8025`

    As credenciais de acesso ao painel do WordPress serão exibidas no final da execução do script.

5.  **Backup do Ambiente**
    Para fazer backup do banco de dados e arquivos do WordPress, use os scripts de backup:

    No Windows:

    ```powershell
    ./scripts/backup.ps1
    ```

    No Linux:

    ```sh
    chmod +x scripts/backup.sh
    ./scripts/backup.sh
    ```

    Os backups serão salvos na pasta `./backups` com a data e hora da execução.

## 🤝 Contribuições

Contribuições são o que tornam a comunidade de código aberto um lugar tão incrível para aprender, inspirar e criar. Qualquer contribuição que você fizer será **muito bem-vinda**.

1.  Faça um Fork do Projeto
2.  Crie sua Feature Branch (`git checkout -b feature/FuncionalidadeIncrivel`)
3.  Faça o Commit de suas alterações (`git commit -m 'Adiciona alguma FuncionalidadeIncrivel'`)
4.  Faça o Push para a Branch (`git push origin feature/FuncionalidadeIncrivel`)
5.  Abra um Pull Request

## 📄 Licença

Distribuído sob a Licença MIT. Veja `LICENSE` para mais informações.

## 📧 Contato

Clayton Del Tedesco Júnior - deltedesco.clayton@outlook.com

Link do Projeto: [https://github.com/ctedescojr/wordpress-website-base](https://github.com/ctedescojr/wordpress-website-base)

<br>
<hr>
<br>
<a name="english"></a>

# Cross-Platform WordPress Development Base (Windows & Linux)

<div align="center">

<br>

_A complete, cross-platform (Windows & Linux) WordPress development environment, built with Docker._

</div>

## 📖 About The Project

<div align="justify">
This project provides a **cross-platform WordPress development base**. It was designed to be a quick and efficient starting point for any WordPress project, allowing developers to get started quickly without worrying about environment setup, whether on Windows or Linux.
</div>
<div align="justify">
Built on a robust foundation of WordPress, the project utilizes a modern development environment with Docker to ensure consistency, security, and ease of maintenance across different operating systems.
</div>

## ✨ Key Features

- 🐳 **Modern Development Environment:** The project is fully containerized with Docker, allowing any developer to spin up the complete environment with a single command.
- 🔧 **Simplified Configuration:** Automated scripts for environment setup and initialization, with support for Windows (PowerShell) and Linux (Bash).
- 📊 **Development Tools:** Includes phpMyAdmin for database management and MailHog for email testing.
- 🔄 **File Synchronization:** Docker volumes configured to synchronize changes in real-time between the host system (Windows/Linux) and containers.
- 🛡️ **Integrated Security:** Optimized configurations for secure development.
- 🚀 **Optimized Performance:** MySQL and PHP configurations adjusted for better performance in a development environment.

## 🚀 Technologies, Tools, and Security

A summary of the technologies used to build, maintain, and protect the platform.

| Main Platform | Development Environment          | Tools & Security                                     |
| :------------ | :------------------------------- | :--------------------------------------------------- |
| WordPress     | Docker & Docker Compose          | Windows & Linux Compatibility                        |
| Default Theme | **WP-CLI** (Command Line)        | Optimized configuration for multiple environments    |
| -             | **MailHog** (Local Email Server) | **SSL/HTTPS** Encryption for all connections         |
| -             | **phpMyAdmin** (DB Manager)      | Codebase following WordPress security best practices |

## 🏁 Getting Started

To get a local copy up and running, follow these simple steps.

### Windows and Linux Compatibility

This project has been specially adapted to work in both Windows and Linux environments. It includes:

- PowerShell scripts (.ps1) for setup and backup on Windows
- Bash scripts (.sh) for setup and backup on Linux
- Docker configurations optimized for both environments
- Configurable port mapping via environment variables
- Environment-specific instructions

### Prerequisites

- Docker
- Docker Compose

### Installation

1.  **Clone the repository**

    ```sh
    git clone [YOUR_GIT_REPOSITORY_URL]
    cd project-name
    ```

2.  **Set Up Project Structure**
    You can use the scripts to create the basic project structure, including folders and configuration files.

    On Windows:

    ```powershell
    ./scripts/create-structure.ps1
    ```

    On Linux:

    ```sh
    chmod +x scripts/create-structure.sh
    ./scripts/create-structure.sh
    ```

    This will create the basic structure and copy the `.env.example` file to `.env`. Edit the `.env` file with your secure passwords.

3.  **Run the Setup Script**
    This script automates the entire environment setup, including the installation of WordPress and essential plugins.

    On Windows:

    ```powershell
    # On Windows, use the PowerShell script
    ./scripts/setup.ps1
    ```

    On Linux:

    ```sh
    # Give the script execution permission (only the first time)
    chmod +x scripts/setup.sh

    # Run the script
    ./scripts/setup.sh
    ```

4.  **Access the Platform**
    After the script finishes, your environment will be ready:

    - **WordPress Site:** `http://localhost:8080`
    - **phpMyAdmin:** `http://localhost:8081`
    - **MailHog:** `http://localhost:8025`

    The login credentials for the WordPress dashboard will be displayed at the end of the script's execution.

5.  **Environment Backup**
    To backup the WordPress database and files, use the backup scripts:

    On Windows:

    ```powershell
    ./scripts/backup.ps1
    ```

    On Linux:

    ```sh
    chmod +x scripts/backup.sh
    ./scripts/backup.sh
    ```

    Backups will be saved in the `./backups` folder with the date and time of execution.

## 🤝 Contributing

Contributions are what make the open-source community such an amazing place to learn, inspire, and create. Any contributions you make are **greatly appreciated**.

1.  Fork the Project
2.  Create your Feature Branch (`git checkout -b feature/AmazingFeature`)
3.  Commit your Changes (`git commit -m 'Add some AmazingFeature'`)
4.  Push to the Branch (`git push origin feature/AmazingFeature`)
5.  Open a Pull Request

## 📄 License

Distributed under the MIT License. See `LICENSE` for more information.

## 📧 Contact

Clayton Del Tedesco Júnior - deltedesco.clayton@outlook.com

Link do Projeto: [https://github.com/ctedescojr/wordpress-website-base](https://github.com/ctedescojr/wordpress-website-base)
