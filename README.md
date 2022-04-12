<!--
                  
This source file is part of the Apodini Example open source project

SPDX-FileCopyrightText: 2018-2021 Paul Schmiedmayer and project authors (see CONTRIBUTORS.md) <paul.schmiedmayer@tum.de>

SPDX-License-Identifier: MIT
             
-->

# Apodini Example

[![DOI](https://zenodo.org/badge/375610092.svg)](https://zenodo.org/badge/latestdoi/375610092)
[![Build and Test](https://github.com/Apodini/ApodiniExample/actions/workflows/build-and-test.yml/badge.svg)](https://github.com/Apodini/ApodiniExample/actions/workflows/build-and-test.yml)
[![Build Docker Compose](https://github.com/Apodini/ApodiniExample/actions/workflows/docker-compose.yml/badge.svg)](https://github.com/Apodini/ApodiniExample/actions/workflows/docker-compose.yml)

This repository includes an example Apodini web service, a shared Swift Package, and an iOS App that can be used as a starting point for an Apodini web service.  

<p float="left">
 <img width="350" alt="Screenshot of the client application showing the contact screen. The connect screen shows a list of all contacts that are added to the application." src="https://user-images.githubusercontent.com/28656495/126041554-4f3064f0-4114-43a7-b235-af24950729b3.png">
 <img width="350" alt="Screenshot of the detail screen showing information about a contact including the residences." src="https://user-images.githubusercontent.com/28656495/126041557-d43004d8-7b9c-493d-b079-af1b925873e2.png">
</p>

## Run the Example System

You can start the Apodini example web services on any system that supports [docker](https://www.docker.com) and [docker compose](https://docs.docker.com/compose/). Follow the instructions on https://docs.docker.com/compose/install/ to install docker and docker compose.
To start and test the web service, you can run the `$ docker compose up` command to start the web service. 

Xcode 13 (only available on macOS) is required to build and run the example client application. Follow the instructions on https://developer.apple.com/xcode/ to install the latest version of Xcode.

1. Opening the *Example.xcworkspace*. The workspace bundles the web services and the client application.
2. Select the *WebService* target, and then the *App* target and start the web service as well as the app by following the instructions on [Running Your App in the Simulator or on a Device](https://developer.apple.com/documentation/xcode/running-your-app-in-the-simulator-or-on-a-device)

## System Functionality

The example system features an example application to manage contacts and their residences.
Please note that this is a demo system and does not include any authentication or authorization mechanisms.
It uses a database to save the contacts and residences on the web service and includes examples of sharing code between a web service and the client application.

### Web Service API

You can test out the API by starting up the web service using the `$ docker compose up` command.

**Create a New Contact Entry:**

`POST` at `/contacts`, e.g. [`http://localhost/contacts`](http://localhost/contacts) with a payload encoded in JSON (header `Content-Type` set to `application/json`) that encodes a contact:
```json
{
 "birthday": 648225181.40703702,
 "name": "Paul"
}
```  
You can try out the following curl command to set a request to the gateway:
```bash
curl --header "Content-Type: application/json" \
   --request POST \
   --data '{"birthday": 648225181.40703702, "name": "Paul"}' \
   http://localhost/contacts
```

**Get All Contacts or a Contact by ID**

`GET` at `/contacts`, e.g. [`http://localhost/contacts`](http://localhost/contacts) that returns the stored contacts.  
You can try out the following curl command to get a list of contacts:
```bash
curl http://localhost/contacts
```

You can get a single contact using `GET` at `/contacts/{contactID}`, e.g. [`http://localhost/contacts/E621E1F8-C36C-495A-93FC-0C247A3E6E5F`](http://localhost/contacts/E621E1F8-C36C-495A-93FC-0C247A3E6E5F) that returns the stored contacts.  
You can try out the following curl command to get a contact by ID:
```bash
curl http://localhost/contacts/E621E1F8-C36C-495A-93FC-0C247A3E6E5F
```

**Update an Existing Contact:**

`POST` at `/contacts/{contactID}`, e.g. [`http://localhost/contacts/E621E1F8-C36C-495A-93FC-0C247A3E6E5F`](http://localhost/contacts/E621E1F8-C36C-495A-93FC-0C247A3E6E5F) with a payload encoded in JSON (header `Content-Type` set to `application/json`) that encodes a contact:
```json
{
 "birthday": 648225181.40703702,
 "name": "Paul Schmiedmayer"
}
```  
You can try out the following curl command to set a request to the gateway:
```bash
curl --header "Content-Type: application/json" \
   --request PUT \
   --data '{"birthday": 648225181.40703702, "name": "Paul Schmiedmayer"}' \
   http://localhost/contacts/E621E1F8-C36C-495A-93FC-0C247A3E6E5F
```

**Delete a Contact**

You can delete a contact using `DELETE` at `/contacts/{contactID}`, e.g. [`http://localhost/contacts/E621E1F8-C36C-495A-93FC-0C247A3E6E5F`](http://localhost/contacts/E621E1F8-C36C-495A-93FC-0C247A3E6E5F).  
You can try out the following curl command to delete a contact:
```bash
curl --request DELETE \
   http://localhost/contacts/E621E1F8-C36C-495A-93FC-0C247A3E6E5F
```

**Create a New Residence for a Contact:**

`POST` at `/residencies/`, e.g. [`http://localhost/residencies`](http://localhost/residencies) with a payload encoded in JSON (header `Content-Type` set to `application/json`) that encodes a contact:
```json
{
 "address": "Munich",
 "contact": {
  "id": "E621E1F8-C36C-495A-93FC-0C247A3E6E5F"
 },
 "country": "Germany",
 "postalCode": "80331"
}
```  
You can try out the following curl command to set a request to the gateway:
```bash
curl --header "Content-Type: application/json" \
   --request POST \
   --data '{"address": "Munich", "contact": {"id": "E621E1F8-C36C-495A-93FC-0C247A3E6E5F"}, "country": "Germany", "postalCode": "80331"}' \
   http://localhost/residencies
```

**Get All Residence or a Residence by ID for a Contact**

`GET` at `/residencies`, e.g. [`http://localhost/residencies`](http://localhost/residencies) that returns the stored residencies.  
You can try out the following curl command to get a list of contacts:
```bash
curl http://localhost/residencies
```

You can get a single residencie using `GET` at `/residencies/{residencieID}`, e.g. [`http://localhost/residencies/E621E1F8-C36C-495A-93FC-0C247A3E6E5F`](http://localhost/residencies/E621E1F8-C36C-495A-93FC-0C247A3E6E5F) that returns the stored residence.  
You can try out the following curl command to get a residence by ID:
```bash
curl http://localhost/residencies/E621E1F8-C36C-495A-93FC-0C247A3E6E5F
```

**Delete a Residence by ID for a Contact**

You can delete a residence using `DELETE` at `/residencies/{contactID}`, e.g. [`http://localhost/residencies/E621E1F8-C36C-495A-93FC-0C247A3E6E5F`](http://localhost/residencies/E621E1F8-C36C-495A-93FC-0C247A3E6E5F).  
You can try out the following curl command to delete a residence:
```bash
curl --request DELETE \
   http://localhost/residencies/E621E1F8-C36C-495A-93FC-0C247A3E6E5F
```

### Client Application

You can use the functionality of the web service using the bundled client application. You can also test the functionality of the app using the bundled unit and UI tests.

## Contributing
Contributions to this project are welcome. Please make sure to read the [contribution guidelines](https://github.com/Apodini/.github/blob/main/CONTRIBUTING.md) and the [contributor covenant code of conduct](https://github.com/Apodini/.github/blob/main/CODE_OF_CONDUCT.md) first.

## License
This project is licensed under the MIT License. See [License](https://github.com/Apodini/ApodiniExample/blob/develop/LICENSE) for more information.
