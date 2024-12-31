
## 👩🏻‍🏫 Workshop API 
The Workshop is handled by this vapor API. The API supports all primary CRUD operations: create, read, update, and delete.

## App Statment 
A system that provides a way for learners who want to enhance their hobbies and skills by facilitating teaching and learning opportunities.

## 📦 Installation
- vapor is available on Mac,Linux.

  ### Mac (To use Vapor on macOS, you will need Swift 5.2 or greater. Swift and all of its dependencies come bundled with Xcode.)
download from [here](https://github.com/matiassingers/awesome-readme](https://docs.vapor.codes/install/macos/))

  ### Linux (To use Vapor, you will need Swift 5.2 or greater. This can be installed using the toolchains available on Swift.org)

download frome [here](https://docs.vapor.codes/install/linux/)

- PostgreSQL database
download frome [here](https://www.postgresql.org/download/)




## Table of content

- [CRUD](#features)
  - [Create](#create)
  - [Delete](#delete)
  - [Update](#update)
  -  [Get](#get)
 
---
## CRUD Operations

### Create
-Every Tutor provide many Workshops\
-Many workshops can have many Learners\
-Many Learners can enroll Many Workshops

### Delete
-Delete Tutor\
-Delete Learner\
-Delete Workshop

### Update
-Can update the date of workshop


### Relationship
1-Tutor provides many workshops ( one to many ) 
2-Many learner can enroll many workshops ( Many to Many ) 


### features
1. **Tutor Profile Management:** Tutors can create and manage their information like skills, experience.
2. **Workshop Creation:** Tutors can create workshops with details like name, date, and location.
3. ⁠ **learner Profile Management:** learner can create and manage their information like skills, experience.
4. **Learner Enrollment:** Learners can enroll in workshops.
4. **LearnerWorkshop :** Track enrollments through a many-to-many relationship between workshops and learners.


## DATABASE SCHEMA
<img width="1169" alt="Screenshot 1445-08-15 at 1 17 26 PM" src="https://github.com/GhaliaAlmuaddi/TuitionManagementSystem/assets/110771258/c5e4fd84-82cc-4332-aabf-14a775dc085b">


