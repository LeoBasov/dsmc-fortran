program DSMC
   use class_writer
   use class_data
   use class_pusher
   use class_domain

   call final()

contains
   subroutine final()
      type(Writer) :: wrt_loc
      class(Data), allocatable :: particles
      type(domain) :: sim_dom
      real :: time_step = 0.1
      integer :: i, number_partilces = 1000, number_itterations = 100
      character(len=1024) :: file_name

      sim_dom = domain(-1.0, 1.0, -1.0, 1.0, -1.0, 1.0)
      call sim_dom%initialize(particles, number_partilces)
      particles%time_step = time_step

      print *, "================================================================"
      print *, "DSMC SIMULATION"
      do i = 1, number_itterations
         !print *, "EXEUTING ITTERATION", i

         call push_particles(particles)
         call sim_dom%execute(particles)

         if (i < 10) then
            write (file_name, "(A10,I1,A4)") "positions_", i, ".csv"
         else if (i < 100) then
            write (file_name, "(A10,I2,A4)") "positions_", i, ".csv"
         else if (i < 1000) then
            write (file_name, "(A10,I3,A4)") "positions_", i, ".csv"
         end if

         file_name = trim(file_name)
         wrt_loc = Writer(file_name)
         call wrt_loc%write (particles)
      end do
      !print *, "DONE"
      !print *, "================================================================"

   end subroutine final

   subroutine init(particles)
      type(Data), intent(inout) :: particles

      integer :: i

      do i = 1, particles%get_size()
         call random_number(particles%positions(i, :))
         call random_number(particles%velocities(i, :))
      end do
   end subroutine init

end program DSMC
