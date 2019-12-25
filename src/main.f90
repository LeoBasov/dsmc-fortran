program DSMC
   use class_writer
   use class_data
   use class_pusher

   call final()

contains
   subroutine final()
      type(Writer) :: wrt_loc
      type(Data) :: particles
      integer :: i, n = 9
      character(len=1024) :: file_name

      particles = Data(12)
      particles%time_step = 1.0

      call init(particles)

      do i = 1, n
         write (file_name, "(A10,I1)") "positions_", i

         file_name = trim(file_name)
         wrt_loc = Writer(file_name)
         call wrt_loc%write (particles)
         call push(particles%positions, particles%velocities, particles%time_step)
      end do

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
