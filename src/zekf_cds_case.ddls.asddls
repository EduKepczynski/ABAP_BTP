@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'CDS View using CASE Statement'
@Metadata.ignorePropagatedAnnotations: true
@ObjectModel.usageType:{
    serviceQuality: #X,
    sizeCategory: #S,
    dataClass: #MIXED
}
define view entity ZEKF_CDS_CASE
  as select from /dmo/travel
{
  key travel_id     as TravelId,
      agency_id     as AgencyId,
      customer_id   as CustomerId,
      begin_date    as BeginDate,
      end_date      as EndDate,
      @Semantics.amount.currencyCode : 'CurrencyCode'
      booking_fee   as BookingFee,
      @Semantics.amount.currencyCode : 'CurrencyCode'
      total_price   as TotalPrice,
      currency_code as CurrencyCode,
      description   as Description,
      status        as Status,

// O CASE inclui um novo campo na tabela do CDS View contendo o texto de acordo com o valor do campo status
      case status

      when 'B' then 'Booked'
      when 'N' then 'New'
      when 'P' then 'Planned'
      when 'X' then 'Cancelled'
      else 'Others'
      end           as Status_Description

}
