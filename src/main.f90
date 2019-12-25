program DSMC
   use class_writer
   use class_data
   use class_pusher

   call final()

contains
   subroutine final()
      type(Writer) :: wrt_loc
      type(Data) :: particles

      particles = Data(12)
      wrt_loc = Writer("positions.csv")

      call init(particles)
      call push(particles%positions, particles%velocities, particles%time_step)
      call wrt_loc%write (particles)

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
