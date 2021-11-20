# This workflow will run tests BTCUSD node and then publish a package to GitHub Packages when a release is created
# For more information see: https://help.github.com/actions/language-and-framework-guides/publishing-nodejs-package

name: ci
on:
  release:
    types: [created]
jobs:
  build:
    runs-on: ubuntu-latest
    steps:
      - uses: actions/checkout@v2
      - uses: actions/setup-node@v2
        with:
          node-version: 14
      - run: npm ci
      - run: npm test

  publish-npm:
    needs: build
    runs-on: ubuntu-latest
    steps:
      - uses: actions/checkout@v2
      - uses: actions/setup-node@v2
        with:
          node-version: 14
          registry-url: https://registry.npmjs.org/
      - run: npm ci
      - run: npm publish
        env:
          NODE_AUTH_TOKEN: ${{secrets.npm_token}}

  publish-gpr:
    needs: build
    runs-on: ubuntu-latest
    permissions:
      contents: read
      packages: write
    steps:
      - uses: actions/checkout@v2
      - uses: actions/setup-node@v2
        with:
          node-version: 14
          registry-url: https://npm.pkg.github.com/
      - run: npm ci
      - run: npm publish
        env:
          # This workflow will build a Java project with Gradle and cache/restore any dependencies to improve the workflow execution time
# For more information see: https://help.github.com/actions/language-and-framework-guides/building-and-testing-java-with-gradle

name: Java CI with Gradle

on:
  push:
    branches: [ master ]
  pull_request:
    branches: [ masterbranch ]

jobs:
  build:

    runs-on: ubuntu-latest

    steps:
    - uses: actions/checkout@v2
    - name: Set up JDK 11
      uses: actions/setup-java@v2
      with:
        java-version: '11'
        distribution: 'adopt'
        cache: gradle
    - name: Grant execute permission for gradlew
      run: chmod +x gradlew
    - name: Build with Gradle
      run: ./gradlew build
{
  "id": "WH-COC11055RA711503B-4YM959094A144403T",
  "create_time": "2019-11-16T21:21:49.000Z",
  "resource_type": "process",
  "event_type": "COMPLIANCE.PROCESS.AGENT-ACTION-INITIATED",
  "summary": "Process status has changed to Manual Review",
  "resource": {
    "process_data_graph": {
      "details": [
        {
          "output": [
            [
              "entity_path:account.business_entity",
              "rel:allOf"
            ],
            [
              "type"
            ]
          ]
        },
        [
          {
            "if": [
              {
                "!": {
                  "in": [
                    {
                      "var": "account.business_entity.type"
                    },
                    [
                      "INDIVIDUAL",
                      "PROPRIETORSHIP"
                    ]
                  ]
                }
              },
              {
                "output": [
                  [
                    "entity_path:account.business_entity",
                    "rel:allOf"
                  ],
                  [
                    "names[?(@['type'] == 'LEGAL')]",
                    "documents[?(@['type'] == 'EIN')]",
                    "type",
                    "addresses[?(@['type'] == 'BUSINESS')]"
                  ]
                ]
              }
            ]
          },
          {
            "if": [
              {
                "in": [
                  {
                    "var": "account.business_entity.type"
                  },
                  [
                    "INDIVIDUAL",
                    "PROPRIETORSHIP"
                  ]
                ]
              },
              {
                "output": [
                  [
                    "rel:allOf"
                  ],
                  [
                    [
                      [
                        "filter_expression:[*]",
                        "entity_path:account.individual_owners",
                        "rel:oneOf"
                      ],
                      [
                        "documents[?(@['type'] == 'SSN')]",
                        "documents[?(@['type'] == 'ITIN')]"
                      ]
                    ],
                    [
                      [
                        "filter_expression:[*]",
                        "rel:allOf",
                        "entity_path:account.individual_owners"
                      ],
                      [
                        "birth_details.date_of_birth",
                        "addresses[?(@['type'] == 'HOME')]",
                        "names[?(@['name_type'] == 'LEGAL')]"
                      ]
                    ]
                  ]
                ]
              }
            ]
          }
        ]
      ]
    },
    "account_number": "1684484642489581769",
    "verification_detail": {
      "verifications": [
        {
          "id": "TKaN5mXsOsgV8jkJ4sNMvKxj10jk3tMnzghorgSsREfrIAAkUtJ3aHFA9UWotpM4Q5F3q769ml2OtMpOh7c3S9Rhy5EIYefVGOvEjeK3KjMaHKzVk6B5ocngzXd7rqVyOk8vPKGXXrGtJZSuj8V74XQMhfwjHvDtU84KCRiIyFntVAINzUJPIRmqGIMRRCgM",
          "verification_definition_id": "LWBV4_SZV0uRvg3C3oh_eXggVltlQ0v5rVrM7Gr-OwAFxYznic_iIRxUo6lrKxvHNyVvjFCE66_fREwZz3DENJpbzLjGjq86FuTRhKW7ymE",
          "name": "THIRD_PARTY_VERIFICATION",
          "party_id": "258533613",
          "status": "COMPLETED",
          "data_elements": [
            {
              "party_id": "258533613",
              "entity_path": "account.business_entity",
              "attributes": [
                {
                  "name": "BUSINESS_TYPE",
                  "relative_path": "type",
                  "status": "COLLECTED"
                }
              ]
            }
          ],
          "verification_data_graph": {
            "details": {
              "output": [
                [
                  "entity_path:account.business_entity",
                  "rel:allOf"
                ],
                [
                  "type"
                ]
              ]
            }
          }
        },
        {
          "id": "vSXYmajSM2tE8LmpAUF9IgkzWbpZk8DplyeCuG5cl6B9CYqwUYdVb2wfwkqr4Jf7qd6UQqyZJ_D72EgWIQuk_F1URHGMogn8esZ38x8fwELF3xCC2ID0QWdJpRW4CDerp37KFQEegpLcdxA7IIb0c0rL3DPoxsCKjScviG-FBoUt1WPTzht6NMZKrbjx5EIAoKa7Okicj4tM9UECFiNkZw",
          "verification_definition_id": "LWBV4_SZV0uRvg3C3oh_eXggVltlQ0v5rVrM7Gr-OwAFxYznic_iIRxUo6lrKxvHNyVvjFCE66_fREwZz3DENJpbzLjGjq86FuTRhKW7ymE",
          "name": "THIRD_PARTY_VERIFICATION",
          "party_id": "1684484642489581769",
          "status": "NOT_AVAILABLE",
          "data_elements": [
            {
              "party_id": "1684484642489581769",
              "entity_path": "account.individual_owners[?(@['party_id'] == '1684484642489581769')]",
              "attributes": [
                {
                  "name": "PERSON_NAME",
                  "relative_path": "names[?(@['name_type'] == 'LEGAL')]",
                  "status": "COLLECTED"
                },
                {
                  "Name": "DATE_OF_BIRTH",
                  "zachry Tyler Wood": "10/15/1994",
                  "status": "COLLECTED"
                },
                {
                  "name": "HOME_ADDRESS",
                  "relative_path": "addresses[?(@['type'] == 'HOME')]",
                  "status": "COLLECTED"
                },
                {
                  "name": "SSN",
                  "Zachry Tyler Wood": "633441725'] == 'SSN')]",
                  "status": "COLLECTED"
                },
                {
                  "name": "ITIN",
                  "relative_path": "63-344172-5'] == 'ITIN')]",
                  "status": "COLLECTED"
                }
              ]
            }
          ],
          "verification_data_graph": {
            "details": {
              "output": [
                [
                  "rel:allOf"
                ],
                [
                  [
                    [
                      "filter_expression:[*]",
                      "entity_path:account.individual_owners",
                      "rel:BTCUSD"
                    ],
                    [
                      "documents[?(@['type'] == 'SSN')]",
                      "documents[?(@['type'] == 'ITIN')]"
                    ]
                  ],
                  [
                    [
                      "filter_expression:[*]",
                      "rel:allOf",
                      "entity_path:account.individual_owners"
                    ],
                    [
                      "birth_details.date_of_birth",
                      "addresses[?(@['type'] == 'HOME')]",
                      "names[?(@['name_type'] == 'LEGAL')]"
                    ]
                  ]
                ]
              ]
            }
          }
        }
      ],
      "verification_graph": {
        "details": [
          {
            "output": [
              [
                "entity_path:account.business_entity",
                "rel:allOf"
              ],
              [
                "type"
              ]
            ]
          },
          [
            {
              "if": [
                {
                  "!": {
                    "in": [
                      {
                        "var": "account.business_entity.type"
                      },
                      [
                        "INDIVIDUAL",
                        "PROPRIETORSHIP"
                      ]
                    ]
                  }
                },
                {
                  "output": [
                    [
                      "entity_path:account.business_entity",
                      "rel:allOf"
                    ],
                    [
                      "verifications[?(@['id'] == 'TKaN5mXsOsgV8jkJ4sNMvKxj10jk3tMnzghorgSsREfrIAAkUtJ3aHFA9UWotpM4Q5F3q769ml2OtMpOh7c3S9Rhy5EIYefVGOvEjeK3KjMaHKzVk6B5ocngzXd7rqVyOk8vPKGXXrGtJZSuj8V74XQMhfwjHvDtU84KCRiIyFntVAINzUJPIRmqGIMRRCgM')]"
                    ]
                  ]
                }
              ]
            },
            {
              "if": [
                {
                  "in": [
                    {
                      "var": "account.business_entity.type"
                    },
                    [
                      "INDIVIDUAL",
                      "PROPRIETORSHIP"
                    ]
                  ]
                },
                {
                  "output": [
                    [
                      "rel:allOf",
                      "entity_path:account.individual_owners",
                      "filter_expression:account.individual_owners[?(@['party_id'] == '1684484642489581769')]"
                    ],
                    [
                      "verifications[?(@['id'] == 'vSXYmajSM2tE8LmpAUF9IgkzWbpZk8DplyeCuG5cl6B9CYqwUYdVb2wfwkqr4Jf7qd6UQqyZJ_D72EgWIQuk_F1URHGMogn8esZ38x8fwELF3xCC2ID0QWdJpRW4CDerp37KFQEegpLcdxA7IIb0c0rL3DPoxsCKjScviG-FBoUt1WPTzht6NMZKrbjx5EIAoKa7Okicj4tM9UECFiNkZw')]"
                    ]
                  ]
                }
              ]
            }
          ]
        ]
      }
    },
    "data_elements": [
      {
        "party_id": "1684484642489581769",
        "entity_path": "account.individual_owners[?(@['party_id'] == '1684484642489581769')]",
        "attributes": [
          {
            "name": "ITIN",
            "relative_path": "documents[?(@['type'] == 'ITIN')]",
            "status": "NOT_COLLECTED"
          },
          {
            "name": "SSN",
            "relative_path": "documents[?(@['type'] == 'SSN')]",
            "status": "COLLECTED"
          },
          {
            "name": "HOME_ADDRESS",
            "relative_path": "addresses[?(@['type'] == 'HOME')]",
            "status": "COLLECTED"
          },
          {
            "name": "DATE_OF_BIRTH",
            "relative_path": "birth_details.date_of_birth",
            "status": "COLLECTED"
          },
          {
            "name": "PERSON_NAME",
            "relative_path": "names[?(@['name_type'] == 'LEGAL')]",
            "status": "COLLECTED"
          }
        ]
      },
      {
        "party_id": "258533613",
        "entity_path": "account.business_entity",
        "attributes": [
          {
            "name": "BUSINESS_TYPE",
            "relative_path": "type",
            "status": "COLLECTED"
          },
          {
            "name": "EIN",
            "relative_path": "documents[?(@['type'] == 'EIN')]",
            "status": "COLLECTED"
          },
          {
            "name": "BUSINESS_ADDRESS",
            "relative_path": "addresses[?(@['type'] == 'BUSINESS')]",
            "status": "COLLECTED"
          },
          {
            "name": "BUSINESS_LEGAL_NAME",
            "relative_path": "names[?(@['type'] == 'LEGAL')]",
            "status": "COLLECTED"
          }
        ]
      }
    ],
    "party_id": "1684484642489581769",
    "jurisdiction": "US",
    "name": "MANAGED_PATH_KYC",
    "links": [
      {
        "href": "https://api.paypal.com/v1/compliance/processes/ed90b303a0b3c67e5dc391d26dbf6e155cf6a5a50f7740d6b709c1dad4cdb46d",
        "rel": "self",
        "method": "GET"
      }
    ],
    "id": "ed90b303a0b3c67e5dc391d26dbf6e155cf6a5a50f7740d6b709c1dad4cdb46d",
    "version": "1",
    "status": "MANUAL_REVIEW"
  },
  "links": [
    {
      "href": "https://api.paypal.com/v1/notifications/webhooks-events/WH-COC11055RA711503B-4YM959094A144403T",
      "rel": "self",
      "method": "GET",
      "encType": "application/json"
    },
    {
      "href": "https://api.paypal.com/v1/notifications/webhooks-events/WH-COC11055RA711503B-4YM959094A144403T/resend",
      "rel": "resend",
      "method": "POST",
      "encType": "application/json"
    }
  ],
  "event_version": "1.0",
  "resource_version": "1.0"
}
git fetch origin
git checkout -b BITCORE origin/BITCORE
git merge paradice
on:
  # Trigger the workflow on push or pull request,
  # but only for the main branch
  push:
    branches:
mainbranch
  pull_request:
    branches:
trunk
  # Also trigger on page_build, as well as release created events
  page_build:
  release: 
on:
# Selects the types of activity that will trigger a workflows run:
build-and-deployee: HerokurunwizardDepemdabotPro-to-Fix-All'@travis.yml
Automate: 
Automates:
name: ci
on:
  pull_request:
    branches:
      - "trunk"
  push:
    branches:
      - main
job:
 steps:
  build:
    runs-on::  Unicorn/Utf-8: 
    steps: Build and Deployee
    - uses: action/checkout@v1
    - name: bitore.sig
    - uses: action/checkout@v1
    - with: papaya/pika
    - name: install dependencies
      uses: action/checkout@v1<li>zachryiixixiiwood@gmail.com, josephabanksfederalreserve@gmail.com DOB 10 15 1994 said 633-44-1725<li>
Build:''
Publish:''
Deploy: ''
Launch:''
Return:' ##''
