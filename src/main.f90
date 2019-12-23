!include "solver/pusher.f90"

program DSMC
   use pusher_solver
   implicit none

   real, dimension(:, :), allocatable :: positions, velocities
   real :: time_step
   integer :: s1, s2
   integer :: i, j

   print *, "Enter the size of the array:"
   read *, s1

   s2 = 3
   time_step = 1.0

   allocate (positions(s1, s2))
   allocate (velocities(s1, s2))

   print *, " x,           y,           z"
   do i = 1, s1
      positions(i, 1) = 1.0
      positions(i, 2) = 2.0
      positions(i, 3) = 3.0

      velocities(i, 1) = 1.0
      velocities(i, 2) = 2.0
      velocities(i, 3) = 3.0

      print *, positions(i, 1), positions(i, 2), positions(i, 3)
   end do

   call push(positions, velocities, time_step)

   print *, " x,           y,           z"
   do i = 1, s1
      print *, positions(i, 1), positions(i, 2), positions(i, 3)
   end do

   deallocate (positions)
   deallocate (velocities)
end program DSMC
