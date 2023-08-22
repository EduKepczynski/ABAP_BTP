@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'CDS View using LEFT OUTER JOIN'
@Metadata.ignorePropagatedAnnotations: true
@ObjectModel.usageType:{
    serviceQuality: #X,
    sizeCategory: #S,
    dataClass: #MIXED
}
define view entity ZEKF_CDS_LEFT_OUTER_JOIN
  as select from    /dmo/booking  as B
    left outer join /dmo/customer as C on C.customer_id = B.customer_id
{
  key C.customer_id   as Customer_ID,
      C.first_name    as First_Name,
      C.last_name     as Last_Name,

      B.booking_id    as Booking_ID,
      B.booking_date  as Booking_Date,
      B.carrier_id    as Carrier_ID,
      B.connection_id as Connection_ID,
      B.flight_date   as Flight_Date
}
