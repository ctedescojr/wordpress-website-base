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

- [cite_start]Scripts PowerShell (.ps1) para configuração e backup no Windows [cite: 1]
- [cite_start]Scripts Bash (.sh) para configuração e backup no Linux [cite: 1]
- [cite_start]Configurações de Docker otimizadas para ambos os ambientes [cite: 1]
- [cite_start]Mapeamento de portas configurável via variáveis de ambiente [cite: 1]
- [cite_start]Instruções específicas para cada ambiente [cite: 1]

### Pré-requisitos

- [cite_start]Docker [cite: 1]
- [cite_start]Docker Compose [cite: 1]

### Instalação

1.  [cite_start]**Clone o repositório** [cite: 1]

    ```sh
    git clone [URL_DO_SEU_REPOSITORIO_GIT]
    cd nome-do-projeto
    ```

2.  [cite_start]**Configure a Estrutura do Projeto** [cite: 1]
    [cite_start]Você pode usar os scripts para criar a estrutura básica do projeto, incluindo pastas e arquivos de configuração. [cite: 1]

    [cite_start]No Windows: [cite: 1]
    ```powershell
    ./scripts/create-structure.ps1
    ```

    [cite_start]No Linux: [cite: 1]
    ```sh
    chmod +x scripts/create-structure.sh
    ./scripts/create-structure.sh
    ```

    [cite_start]Isso criará a estrutura básica e copiará o arquivo `.env.example` para `.env`. [cite: 1] [cite_start]Edite o arquivo `.env` com suas senhas seguras. [cite: 1]

3.  [cite_start]**Execute o Script de Instalação** [cite: 1]
    [cite_start]Este script automatiza toda a configuração do ambiente, incluindo a instalação do WordPress e dos plugins essenciais. [cite: 1]

    [cite_start]No Windows: [cite: 1]
    ```powershell
    # No Windows, use o script PowerShell
    ./scripts/setup.ps1
    ```

    [cite_start]No Linux: [cite: 1]
    ```sh
    # Dê permissão de execução ao script (apenas na primeira vez)
    chmod +x scripts/setup.sh

    # Rode o script
    ./scripts/setup.sh
    ```

4.  [cite_start]**Acesse a Plataforma** [cite: 1]
    [cite_start]Após a conclusão do script, seu ambiente estará pronto: [cite: 1]

    - [cite_start]**Site WordPress:** `http://localhost:8080` [cite: 1]
    - [cite_start]**phpMyAdmin:** `http://localhost:8081` [cite: 1]
    - [cite_start]**MailHog:** `http://localhost:8025` [cite: 1]

    [cite_start]As credenciais de acesso ao painel do WordPress serão exibidas no final da execução do script. [cite: 1]

5.  [cite_start]**Backup do Ambiente** [cite: 1]
    [cite_start]Para fazer backup do banco de dados e arquivos do WordPress, use os scripts de backup: [cite: 1]

    [cite_start]No Windows: [cite: 1]
    ```powershell
    ./scripts/backup.ps1
    ```

    [cite_start]No Linux: [cite: 1]
    ```sh
    chmod +x scripts/backup.sh
    ./scripts/backup.sh
    ```

    [cite_start]Os backups serão salvos na pasta `./backups` com a data e hora da execução. [cite: 1]

## 🤝 Contribuições

[cite_start]Contribuições são o que tornam a comunidade de código aberto um lugar tão incrível para aprender, inspirar e criar. [cite: 1] [cite_start]Qualquer contribuição que você fizer será **muito bem-vinda**. [cite: 1]

1.  [cite_start]Faça um Fork do Projeto [cite: 1]
2.  [cite_start]Crie sua Feature Branch (`git checkout -b feature/FuncionalidadeIncrivel`) [cite: 1]
3.  [cite_start]Faça o Commit de suas alterações (`git commit -m 'Adiciona alguma FuncionalidadeIncrivel'`) [cite: 1]
4.  [cite_start]Faça o Push para a Branch (`git push origin feature/FuncionalidadeIncrivel`) [cite: 1]
5.  [cite_start]Abra um Pull Request [cite: 1]

## 📄 Licença

[cite_start]Distribuído sob a Licença MIT. [cite: 1] [cite_start]Veja `LICENSE` para mais informações. [cite: 1]

## 📧 Contato

[cite_start]Clayton Del Tedesco Júnior - deltedesco.clayton@outlook.com [cite: 1]

[cite_start]Link do Projeto: [https://github.com/ctedescojr/wordpress-website-base](https://github.com/ctedescojr/wordpress-website-base) [cite: 1]

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
- [cite_start]📊 **Development Tools:** Includes phpMyAdmin for database management and MailHog for email testing. [cite: 1]
- 🔄 **File Synchronization:** Docker volumes configured to synchronize changes in real-time between the host system (Windows/Linux) and containers.
- [cite_start]🛡️ **Integrated Security:** Optimized configurations for secure development. [cite: 1]
- [cite_start]🚀 **Optimized Performance:** MySQL and PHP configurations adjusted for better performance in a development environment. [cite: 1]

## 🚀 Technologies, Tools, and Security

A summary of the technologies used to build, maintain, and protect the platform.

| Main Platform | Development Environment          | Tools & Security                                             |
| :------------ | :------------------------------- | :------------------------------------------------------------ |
| WordPress     | Docker & Docker Compose          | Windows & Linux Compatibility                                 |
| Default Theme | **WP-CLI** (Command Line)        | Optimized configuration for multiple environments             |
| -             | **MailHog** (Local Email Server) | **SSL/HTTPS** Encryption for all connections                  |
| -             | **phpMyAdmin** (DB Manager)      | Codebase following WordPress security best practices          |

## 🏁 Getting Started

[cite_start]To get a local copy up and running, follow these simple steps. [cite: 1]

### Windows and Linux Compatibility

[cite_start]This project has been specially adapted to work in both Windows and Linux environments. [cite: 1] It includes:

- [cite_start]PowerShell scripts (.ps1) for setup and backup on Windows [cite: 1]
- [cite_start]Bash scripts (.sh) for setup and backup on Linux [cite: 1]
- [cite_start]Docker configurations optimized for both environments [cite: 1]
- [cite_start]Configurable port mapping via environment variables [cite: 1]
- [cite_start]Environment-specific instructions [cite: 1]

### Prerequisites

- [cite_start]Docker [cite: 1]
- [cite_start]Docker Compose [cite: 1]

### Installation

1.  [cite_start]**Clone the repository** [cite: 1]

    ```sh
    git clone [YOUR_GIT_REPOSITORY_URL]
    cd project-name
    ```

2.  [cite_start]**Set Up Project Structure** [cite: 1]
    [cite_start]You can use the scripts to create the basic project structure, including folders and configuration files. [cite: 1]

    [cite_start]On Windows: [cite: 1]
    ```powershell
    ./scripts/create-structure.ps1
    ```

    [cite_start]On Linux: [cite: 1]
    ```sh
    chmod +x scripts/create-structure.sh
    ./scripts/create-structure.sh
    ```

    [cite_start]This will create the basic structure and copy the `.env.example` file to `.env`. [cite: 1] [cite_start]Edit the `.env` file with your secure passwords. [cite: 1]

3.  [cite_start]**Run the Setup Script** [cite: 1]
    [cite_start]This script automates the entire environment setup, including the installation of WordPress and essential plugins. [cite: 1]

    [cite_start]On Windows: [cite: 1]
    ```powershell
    # On Windows, use the PowerShell script
    ./scripts/setup.ps1
    ```

    [cite_start]On Linux: [cite: 1]
    ```sh
    # Give the script execution permission (only the first time)
    chmod +x scripts/setup.sh

    # Run the script
    ./scripts/setup.sh
    ```

4.  [cite_start]**Access the Platform** [cite: 1]
    [cite_start]After the script finishes, your environment will be ready: [cite: 1]

    - [cite_start]**WordPress Site:** `http://localhost:8080` [cite: 1]
    - [cite_start]**phpMyAdmin:** `http://localhost:8081` [cite: 1]
    - [cite_start]**MailHog:** `http://localhost:8025` [cite: 1]

    [cite_start]The login credentials for the WordPress dashboard will be displayed at the end of the script's execution. [cite: 1]

5.  [cite_start]**Environment Backup** [cite: 1]
    [cite_start]To backup the WordPress database and files, use the backup scripts: [cite: 1]

    [cite_start]On Windows: [cite: 1]
    ```powershell
    ./scripts/backup.ps1
    ```

    [cite_start]On Linux: [cite: 1]
    ```sh
    chmod +x scripts/backup.sh
    ./scripts/backup.sh
    ```

    [cite_start]Backups will be saved in the `./backups` folder with the date and time of execution. [cite: 1]

## 🤝 Contributing

[cite_start]Contributions are what make the open-source community such an amazing place to learn, inspire, and create. [cite: 1] [cite_start]Any contributions you make are **greatly appreciated**. [cite: 1]

1.  [cite_start]Fork the Project [cite: 1]
2.  [cite_start]Create your Feature Branch (`git checkout -b feature/AmazingFeature`) [cite: 1]
3.  [cite_start]Commit your Changes (`git commit -m 'Add some AmazingFeature'`) [cite: 1]
4.  [cite_start]Push to the Branch (`git push origin feature/AmazingFeature`) [cite: 1]
5.  [cite_start]Open a Pull Request [cite: 1]

## 📄 License

[cite_start]Distributed under the MIT License. [cite: 1] [cite_start]See `LICENSE` for more information. [cite: 1]

## 📧 Contact

[cite_start]Clayton Del Tedesco Júnior - deltedesco.clayton@outlook.com [cite: 1]

[cite_start]Link do Projeto: [https://github.com/ctedescojr/wordpress-website-base](https://github.com/ctedescojr/wordpress-website-base) [cite: 1]