using System;
using TimeManagementBooking;
using Xunit;
using Moq;


namespace TimeManagementUT
{
    public class TimeBProcUT
    {
        [Fact]
        public void InvalidateEmpId()
        {
            //var bookingProcessor = new Mock<IBookingProcessor>();
            var timeBProc= new TimeBProcessor();
            Assert.Throws<ArgumentOutOfRangeException>(() => timeBProc.BookTime(new Employee(),DateTime.Today,8));
        }

        [Fact]
        public void InvalidateDate()
        {
            var timeBProc= new TimeBProcessor();
            Assert.Throws<ArgumentOutOfRangeException>(() => timeBProc.BookTime(
                new Employee{empId=2},DateTime.Today.AddDays(1),8));
        }

        [Fact]
        public void InvalidateDuration()
        {
            var timeBProc= new TimeBProcessor();
            Assert.Throws<ArgumentOutOfRangeException>(() => timeBProc.BookTime(
                new Employee{empId=2},DateTime.Today,10));
        }

        [Fact]
        public void validateOutput()
        {
            var timeBProc= new TimeBProcessor();
            Assert.True(timeBProc.BookTime(new Employee{empId=3},DateTime.Today,9));
        }
    }
}
