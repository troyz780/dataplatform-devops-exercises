IF OBJECT_ID('Report.HotelReservationCount') IS NOT NULL DROP FUNCTION Report.HotelReservationCount;
GO
CREATE VIEW Report.HotelReservationCount
AS

  SELECT h.HotelId, h.Name, h.HotelState, count(r.ReservationId) count_reservation
  from Vendors.Hotels h, Booking.Reservations r
  where h.hotelId = r.hotelId
  group by h.hotelId, h.Name, h.HotelState
  
GO