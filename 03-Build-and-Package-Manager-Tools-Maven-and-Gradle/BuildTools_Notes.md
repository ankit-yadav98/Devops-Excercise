# Build Tools: Maven & Gradle & JS Package Manager

## What are Build Tools?

Build tools automate repetitive tasks in software development such as:
- Downloading dependencies (libraries)
- Compiling source code
- Running tests
- Packaging application into `.jar` or `.war`
- Deploying application

---

## Maven

### What is Maven?
Maven is a **Build Automation and Project Management Tool** for Java projects. It uses an XML-based configuration file called `pom.xml` (Project Object Model) to manage the project build lifecycle.

### How Maven works
1. Developer defines dependencies in `pom.xml`
2. Maven downloads dependencies from **Maven Central Repository**
3. Saves downloaded dependencies in **local repository** (`~/.m2/repository`)
4. Compiles, tests, and packages the application

### Maven Configuration File (pom.xml)
```xml
<project>
    <groupId>com.example</groupId>
    <artifactId>my-app</artifactId>
    <version>1.0.0</version>

    <dependencies>
        <dependency>
            <groupId>org.springframework.boot</groupId>
            <artifactId>spring-boot-starter</artifactId>
            <version>2.7.0</version>
        </dependency>
    </dependencies>
</project>
```

### Maven Build Lifecycle
```
validate → compile → test → package → verify → install → deploy
```

### Common Maven Commands
```bash
mvn clean           # delete target folder
mvn compile         # compile source code
mvn test            # run tests only
mvn package         # compile + test + package into jar/war
mvn install         # package + install into local repository (~/.m2)
mvn deploy          # deploy to remote repository
mvn dependency:tree # show all dependencies
mvn --version       # check maven version
```

### Maven Project Structure
```
my-app/
├── pom.xml                         # Maven configuration file
└── src/
    ├── main/
    │   └── java/
    │       └── com/example/
    │           └── App.java
    └── test/
        └── java/
            └── com/example/
                └── AppTest.java
```

### Maven Output
```
my-app/
└── target/
    └── my-app-1.0.0.jar            # Final packaged application
```

---

## Gradle

### What is Gradle?
Gradle is a **Build Automation Tool** that is faster and more flexible than Maven. It uses a Groovy or Kotlin based configuration file called `build.gradle`.

### How Gradle works
1. Developer defines dependencies in `build.gradle`
2. Gradle downloads dependencies from configured repositories
3. Compiles, tests, and packages the application
4. Uses **incremental builds** to only rebuild what has changed (faster)

### Gradle Configuration File (build.gradle)
```groovy
plugins {
    id 'java'
    id 'org.springframework.boot' version '2.7.0'
}

dependencies {
    implementation 'org.springframework.boot:spring-boot-starter:2.7.0'
    testImplementation 'junit:junit:4.13'
}
```

### Gradle Build Lifecycle
```
Initialization → Configuration → Execution
```

### Common Gradle Commands
```bash
gradle clean            # delete build folder
gradle compile          # compile source code
gradle test             # run tests only
gradle build            # compile + test + package
gradle dependencies     # show all dependencies
gradle tasks            # list all available tasks
gradle --version        # check gradle version
./gradlew build         # use gradle wrapper (recommended)
```

### Gradle Project Structure
```
my-app/
├── build.gradle                    # Gradle configuration file
├── settings.gradle                 # Project settings
├── gradlew                         # Gradle wrapper (Linux/Mac)
├── gradlew.bat                     # Gradle wrapper (Windows)
└── src/
    ├── main/
    │   └── java/
    │       └── com/example/
    │           └── App.java
    └── test/
        └── java/
            └── com/example/
                └── AppTest.java
```

### Gradle Output
```
my-app/
└── build/
    └── libs/
        └── my-app-1.0.0.jar        # Final packaged application
```

---

## Differences Between Maven and Gradle

| Feature | Maven | Gradle |
|---|---|---|
| **Configuration file** | `pom.xml` (XML) | `build.gradle` (Groovy/Kotlin) |
| **Configuration style** | Declarative (XML) | Declarative + Imperative (code) |
| **Build speed** | Slower | Faster (incremental builds) |
| **Flexibility** | Less flexible (strict conventions) | More flexible (customizable) |
| **Learning curve** | Easier (beginner friendly) | Harder (needs Groovy/Kotlin knowledge) |
| **Dependency management** | Maven Central | Maven Central + custom repos |
| **Output folder** | `target/` | `build/` |
| **Wrapper** | `mvnw` | `gradlew` |
| **Performance** | Rebuilds everything | Only rebuilds changed parts |
| **Popular with** | Java Enterprise, Spring | Android, Spring Boot |
| **Community** | Large, mature | Growing, modern |
| **Multi-project builds** | Supported but complex | Excellent support |

---

## When to use Maven vs Gradle?

| Use Case | Recommended Tool |
|---|---|
| Simple Java projects | Maven |
| Enterprise Java projects | Maven |
| Android development | Gradle |
| Projects needing fast builds | Gradle |
| Teams new to build tools | Maven |
| Highly customized build process | Gradle |
| Spring Boot projects | Both work well |

---

## Maven vs Gradle — Repository

Both Maven and Gradle download dependencies from the same repository:

```
Maven Central Repository: https://repo.maven.apache.org/maven2
```

Local repository location:
```bash
~/.m2/repository    # Maven local cache
~/.gradle/caches    # Gradle local cache
```

---

## Gradle Wrapper vs System Gradle

Always prefer using **Gradle Wrapper** (`./gradlew`) over system Gradle:

```bash
# System gradle (may have version issues)
gradle build

# Gradle wrapper (uses project's exact gradle version) ✅
./gradlew build
```

The wrapper version is defined in:
```
gradle/wrapper/gradle-wrapper.properties
```

---

## Quick Reference

### Maven
```bash
mvn clean package       # clean + build
mvn spring-boot:run     # run Spring Boot app
mvn -DskipTests package # build without running tests
```

### Gradle
```bash
./gradlew clean build       # clean + build
./gradlew bootRun           # run Spring Boot app
./gradlew build -x test     # build without running tests
```
---

# Building a JavaScript Application

JavaScript does not need a build tool. Unlike Java, JS is interpreted directly by Node.js or the browser. npm is just a package manager, not a build tool like Maven or Gradle.

Some JS frameworks use build/bundling tools but only for:

| Tool | Purpose | Required? |
| Webpack/Vite | Bundle multiple files into one | Only for frontend/React|
|Babel | Convert modern JS to older JS | Only for browser compatibility |
|TypeScript| Compile `.ts` → `.js` | Only if using TypeScript |

These are optional and only needed for frontend apps — not for Node.js backend apps.

---

## Package Managers

JavaScript uses **package managers** to manage dependencies, unlike Java (Maven/Gradle).

### Most Common Package Managers

| Tool | Command | Config File |
|---|---|---|
| **npm** | `npm` | `package.json` |
| **yarn** | `yarn` | `package.json` |
| **pnpm** | `pnpm` | `package.json` |

---

## npm (Node Package Manager)

### Install Node.js and npm

```bash
# Install Node.js (npm comes with it)
sudo apt update
sudo apt install nodejs npm

# Verify installation
node --version
npm --version
```

### Initialize a JS Project

```bash
# Create new project folder
mkdir my-js-app
cd my-js-app

# Initialize project (creates package.json)
npm init

# Or initialize with defaults (skip questions)
npm init -y
```

---

## package.json — Configuration File

This is the **heart of any JS project** (similar to `pom.xml` for Maven):

```json
{
  "name": "my-js-app",
  "version": "1.0.0",
  "description": "My JavaScript Application",
  "main": "index.js",
  "scripts": {
    "start": "node index.js",
    "build": "webpack --mode production",
    "test": "jest",
    "dev": "webpack serve --mode development"
  },
  "dependencies": {
    "express": "^4.18.2",
    "react": "^18.2.0"
  },
  "devDependencies": {
    "webpack": "^5.88.0",
    "jest": "^29.0.0"
  }
}
```

### dependencies vs devDependencies

| Type | Used For | Example |
|---|---|---|
| `dependencies` | Required in production | express, react |
| `devDependencies` | Only needed during development | webpack, jest, eslint |

---

## Installing Dependencies

```bash
# Install all dependencies from package.json
npm install

# Install a specific package
npm install express

# Install as dev dependency
npm install --save-dev webpack

# Install globally
npm install -g nodemon

# Install specific version
npm install express@4.18.2
```

---

## Common npm Commands

```bash
npm init                  # initialize new project
npm install               # install all dependencies
npm install <package>     # install specific package
npm uninstall <package>   # remove a package
npm update                # update all packages
npm run start             # run start script
npm run build             # run build script
npm run test              # run test script
npm list                  # list installed packages
npm outdated              # check for outdated packages
npm audit                 # check for security vulnerabilities
npm audit fix             # fix vulnerabilities automatically
```

---

## Project Structure

### Simple Node.js App
```
my-js-app/
├── package.json            # project config and dependencies
├── package-lock.json       # exact versions of installed packages
├── node_modules/           # installed dependencies (never commit this)
├── index.js                # main entry point
└── src/
    ├── app.js
    └── utils.js
```

### React App Structure
```
my-react-app/
├── package.json
├── package-lock.json
├── node_modules/           # never commit to git
├── public/
│   └── index.html
└── src/
    ├── index.js            # entry point
    ├── App.js              # main component
    └── components/
        └── Header.js
```

---

## Build Tools for JavaScript

### 1. Webpack
Most popular bundler — bundles all JS files into one file:

```bash
# Install webpack
npm install --save-dev webpack webpack-cli

# Build for production
npx webpack --mode production

# Build for development
npx webpack --mode development
```

### 2. Vite (Modern, Fast)
Modern build tool — faster than webpack:

```bash
# Create new Vite project
npm create vite@latest my-app

# Install dependencies
cd my-app
npm install

# Start dev server
npm run dev

# Build for production
npm run build
```

### 3. Parcel (Zero config)
Zero configuration bundler:

```bash
# Install parcel
npm install --save-dev parcel

# Start dev server
npx parcel index.html

# Build for production
npx parcel build index.html
```

---

## Building Different Types of JS Apps

### Node.js App
```bash
# Install dependencies
npm install

# Run the app
node index.js

# Or using npm script
npm start
```

### React App (Create React App)
```bash
# Create new React app
npx create-react-app my-react-app
cd my-react-app

# Start development server
npm start

# Build for production
npm run build

# Run tests
npm test
```

### React App (Vite)
```bash
# Create new React app with Vite
npm create vite@latest my-react-app -- --template react
cd my-react-app

# Install dependencies
npm install

# Start development server
npm run dev

# Build for production
npm run build
```

---

## Build Output

After running `npm run build`:

```
my-app/
└── dist/                   # production ready files
    ├── index.html
    ├── main.js             # bundled + minified JS
    └── main.css            # bundled + minified CSS
```

---

## package-lock.json

Auto-generated file that **locks exact versions** of all installed packages:

```bash
# Never manually edit this file
# Always commit this file to git
# Delete and reinstall if corrupted
rm -rf node_modules package-lock.json
npm install
```

---

## .gitignore for JS Projects

Always add `node_modules` to `.gitignore`:

```bash
# Create .gitignore
echo "node_modules/" >> .gitignore
echo "dist/" >> .gitignore
echo ".env" >> .gitignore
```

---

## Environment Variables in JS

```bash
# Create .env file
touch .env
```

```
# .env file
PORT=3000
DB_URL=mongodb://localhost:27017
API_KEY=mysecretkey
```

Access in code:
```javascript
const port = process.env.PORT
const dbUrl = process.env.DB_URL
```

---

## npm vs Maven/Gradle Comparison

| Feature | npm (JS) | Maven (Java) | Gradle (Java) |
|---|---|---|---|
| **Config file** | `package.json` | `pom.xml` | `build.gradle` |
| **Dependencies folder** | `node_modules/` | `~/.m2/` | `~/.gradle/` |
| **Install command** | `npm install` | `mvn install` | `gradle build` |
| **Build command** | `npm run build` | `mvn package` | `gradle build` |
| **Test command** | `npm test` | `mvn test` | `gradle test` |
| **Lock file** | `package-lock.json` | N/A | N/A |

---

## Quick Start Summary

```bash
# 1. Install Node.js and npm
sudo apt install nodejs npm

# 2. Create new project
mkdir my-app && cd my-app
npm init -y

# 3. Install dependencies
npm install express

# 4. Create entry point
touch index.js

# 5. Run the app
node index.js

# 6. Build for production
npm run build
```
