using System;

namespace TimeManagementBooking
{
    interface ITimeBProcessor
    {
        bool BookTime(Employee employee, DateTime date, decimal duration);
      
    }
}
