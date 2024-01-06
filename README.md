<img src="./screenshot/docsync.png">
  
# Docsync
**Realtime Collaborative Document Editor**

This is the client application for Docsync, a real-time collaborative cross-platform document editor available on Android, iOS, Web, and Desktop.

### Tech Stack

> ### Frontend
>
> Flutter, Dart, Riverpod, Retrofit, Dio, Quill, Socket.IO, Freezed, GoRouter
>
> ![](https://skillicons.dev/icons?i=flutter,dart&theme=light)

> ### Backend:
>
> Typescript, Node.js, Express, MongoDB, Socket.IO, Docker, Grafana, Prometheus , AWS S3, EC2
>
> ![](https://skillicons.dev/icons?i=nodejs,typescript,express,mongodb,prometheus,grafana,aws&theme=light)
>
> **Backend Repo Link**: [Docsync server](https://github.com/subrotokumar/doc-sync-server)  
> **Backend API Docs:** [API Documentation](https://docsync.subrotokumar.com/docs)

### Key features:

- User authentication and access control
- Realtime collaborative editing using Socket.IO
- Document CRUD (create, read, update, delete) operations
- User profiles and management
- Cross-platform
- Build using clean architecture

### Prerequisites

- Flutter SDK
- Dart SDK

### Getting Started

1. Installation

   ```bash
   # Clone the repo
   git clone https://github.com/subrotokumar/doc-sync.git
   cd doc-sync

   # Install dependencies
   flutter pub get
   ```

2. Create `.env` file at project level and add below data in it:

   ```.env
   endpoint="https://localhost:3001"
   ```

3. Run below command to create generator files:
   ```bash
   dart run build_runner build
   ```
4. Run the program
   ```
   # Run the app
   flutter run
   ```

**Supported Platforms:**

- Desktop (currently available)
- Android
- iOS
- Web

**License**: [MIT](./LICENSE)
