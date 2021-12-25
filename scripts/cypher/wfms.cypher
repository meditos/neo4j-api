// Job descriptions
CREATE (FindCustomerContact:Job {description:'Find the customer contact for a specific product.'})
CREATE (FindCountryOfOrigin:Job {description:'Find the country of origin for a specific product.'})

CREATE (FindCustomerContactEmail:Job {description:'Find the customer contact email.'})
CREATE (SendCustomerContactEmailToAct:Job {description:'Send the customer contact email to AACCTT.'})

CREATE (SendEmailToAskCountry:Job {description:'Ask for the country of origin of a product.'})
CREATE (SendCountryAnswerToAct:Job {description:'Send the answer to AACCTT.'})

CREATE (TomatoCherry:Product {id:5342, name:'Tomato Cherry'})
CREATE (Cocacola:Product {id:5343, name:'Coca-cola'})
CREATE (RufflesChips:Product {id:5344, name:'Ruffles Chips'})

CREATE
(FindCustomerContact)-[:ABOUT_PRODUCT]->(TomatoCherry),
(FindCustomerContact)-[:ABOUT_PRODUCT]->(Cocacola),
(FindCustomerContact)-[:ABOUT_PRODUCT]->(RufflesChips),

(FindCustomerContact)-[:SUB_JOB]->(FindCustomerContactEmail),
(FindCustomerContact)-[:SUB_JOB]->(SendCustomerContactEmailToAct),
(FindCustomerContactEmail)-[:PRECEDES]->(SendCustomerContactEmailToAct),

(FindCountryOfOrigin)-[:ABOUT_PRODUCT]->(TomatoCherry),
(FindCountryOfOrigin)-[:ABOUT_PRODUCT]->(Cocacola),
(FindCountryOfOrigin)-[:ABOUT_PRODUCT]->(RufflesChips),

(FindCountryOfOrigin)-[:SUB_JOB]->(SendEmailToAskCountry),
(FindCountryOfOrigin)-[:SUB_JOB]->(SendCountryAnswerToAct),
(SendEmailToAskCountry)-[:PRECEDES]->(SendCountryAnswerToAct)
