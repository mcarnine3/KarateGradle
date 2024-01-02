# language: en

Feature: Get geographical data of a country
  #Especificar título del feature sobre lo que haré

  Background:
    * url api.baseUrl
    #* path geoPath = '/timezoneJSON'
    * path endpoint.geoPath
    * params {username: #(user.name), formatted: true, lat: #(latitude), lng: #(longitude)}
    * def responseSuccessful = read("successful-response-get.json")
    * def responseFailedParameter = read("fail-parsing-parameter-get.json")
    * def responseDataColombia = read("response-data-colombia-get.json")

  @Obtener-data-de-paises
  Scenario Outline: Get geographical data of a country
    When method get
    Then status 200
    And match $ == responseSuccessful

    Examples:
    |latitude|longitude|
    |4       |-72      |
    |8       |-8       |
    |4.2     |-72.5    |
    |0       |-72      |
    |8       |-8f      |
    |-75     |80       |

  @Obtener-data-de-colombia
  Scenario Outline: Get geographical data of Colombia
    When method get
    Then status 200
    And match $ == responseDataColombia

    Examples:
    |latitude|longitude|
    |4       |-74      |

  @Obtener-data-de-paises-parametros-invalidos
  Scenario Outline: Get geographical data of a country with parameters invalid
    When method get
    Then status 200
    And match $ == responseFailedParameter

    Examples:
    |latitude|longitude|
    |ñ       |-72      |
    |8       |a        |
    |.       |-5       |
    |%&$     |aas      |
    |8       |-a8f     |

  @Obtener-data-de-paises-sin-info
  Scenario Outline: Get geographical data of a country that does not have information
    When method get
    Then status 200
    And match $ == {"status": {"message": "no timezone information found for lat/lng","value": 15}}

    Examples:
    |latitude|longitude|
    |90      |70       |
    |90      |99       |

  @Obtener-data-de-paises-lat-lng-invalid
  Scenario Outline: Get geographical data of a country with latitude and longitude invalid
    When method get
    Then status 200
    And match $ == {"status": {"message": "invalid lat/lng","value": 14}}

    Examples:
    |latitude|longitude|
    |81      |901      |
    |700     |801      |