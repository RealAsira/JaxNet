# An EC:Pages Website - The JaxNet Project

## JaxNet Webserver/site and TSQL Database Project

### Summary

JaxNet is a webserver/database platform aimed at building and deploying a secure, modular, and efficient network of web-based services and applications. It leverages a custom web-language, [EC:Pages](https://github.com/realasira/ecpages), alongside widely-used web technologies like SQL, JavaScript, HTML, and CSS, enabling seamless data integration and dynamic user interfaces. The primary goal of JaxNet is to streamline the development of scalable database-driven applications with enhanced reliability and security. This project focuses on minimizing deployment complexity and improving maintainability by creating a centralized, adaptable infrastructure for web development needs.

JaxNet's development is increasingly focused on its eCommerce capabilities, aiming to build a platform optimized for online retail and customer interaction. Future enhancements may include customizable product catalogs, real-time inventory updates, and secure checkout processes, all tailored to support seamless and secure online transactions. This eCommerce direction drives JaxNet’s goal of creating a versatile, reliable foundation for modern retail solutions.

### Features

- Robust employee console allows for extensive management of products, users/customers, employees, finances, inventory, user-facing UX modification, and more.
- Provides granular permission levels, enabling different levels of access for admins, employees, users; included is dynamic/different levels of access for each of the categories.
- SEO management and site-level marketing tools such as highlights and documents.
- Data is virtually real time as it is accessed directly from the database at time of request.
- Extensive server action logging on IP, session, and user levels; Ability to manage blacklist and "Access Control List" depending on risky user behavior.
- Ability to create and run custom code (albeit restricted for security) from within the employee console.

### Feature Notes

- This project is incomplete and may evolve over time.
- Not all features listed are fully implemented but are intended.
- More updates to come!

## Installation

Installation involves following the steps in the [EC:Pages Technical Specification](https://github.com/realasira/ecpages/wiki).

Brief version:

- JaxNet requires a TSQL database (EC:Pages is also compatible with MySQL and sqlite).
- /ecpages subdir needs to be at "C:/inetpub/".
- settings_example.xml file included is a sample with confidential information redacted ... update information and rename to settings.xml
- IIS application pool needs to use the .dll in /ecpages and be granted proper system permissions to operate

## Contributions

The developer is not currently taking contributions to this project. The project is currently inactive.
