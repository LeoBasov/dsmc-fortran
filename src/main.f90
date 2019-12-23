program DSMC
   use class_data
   use pusher_solver

   call final()

contains
   subroutine final()
      type(Data) :: tst
      real :: time_step = 1.0
      integer :: i, arr_size

      arr_size = 5
      tst = Data(arr_size)
      tst%time_step = time_step

      do i = 1, arr_size
         tst%positions(i, 1) = 1.0
         tst%positions(i, 2) = 2.0
         tst%positions(i, 3) = 3.0

         tst%velocities(i, 1) = 4.0
         tst%velocities(i, 2) = 5.0
         tst%velocities(i, 3) = 6.0

         print *, tst%positions(i, 1), tst%positions(i, 2), tst%positions(i, 3)
      end do

      print *, "=============================================================="

      call push(tst%positions, tst%velocities, tst%time_step)

      do i = 1, arr_size
         print *, tst%positions(i, 1), tst%positions(i, 2), tst%positions(i, 3)
      end do

   end subroutine final

end program DSMC
