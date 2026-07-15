# Build Tools: Maven & Gradle

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
