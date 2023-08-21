@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'CDS View - SFLIGHT'
@Metadata.ignorePropagatedAnnotations: true
@ObjectModel.usageType:{
    serviceQuality: #X,
    sizeCategory: #S,
    dataClass: #MIXED
}

define view entity zekf_cds_flight
  with parameters
    //Aqui definimos parâmetros de entrada. Colocar na cláusula WHERE.
    //Também deve colocar no select da classe que chama esse CDS.
    //Ver na classe zcl_display_cds_flight
    carrid : /dmo/carrier_id
  as select from /dmo/flight
{
      //Os ALIAS, definidos depois do AS, alteram o nome das colunas na exibição da tabela interna

  key carrier_id     as CarrierId,
  key connection_id  as ConnectionId,
  key flight_date    as FlightDate,

      // Aqui foi necessário colocar a semântica para não dar erro no campo PRICE
      // O erro é o demonstrado abaixo:
      // ZEKF_CDS_FLIGHT-PRICE reference information missing or data type wrong, see long text
      @Semantics.amount.currencyCode: 'CurrencyCode'
      price          as Price,
      currency_code  as CurrencyCode,
      plane_type_id  as PlaneTypeId,
      seats_max      as SeatsMax,
      seats_occupied as SeatsOccupied
}

// Podemos usar a cláusula WHERE como no SELECT

where
      price      < 2000
  and carrier_id = $parameters.carrid // Incluir o parâmetro de entrada na cláusula WHERE
