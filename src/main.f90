program DSMC
   use class_writer
   use class_data

   call final()

contains
   subroutine final()
      type(Writer) :: wrt_loc
      type(Data) :: particles

      particles = Data(12)
      wrt_loc = Writer("positions.csv")

      call wrt_loc%write (particles)

   end subroutine final

end program DSMC
