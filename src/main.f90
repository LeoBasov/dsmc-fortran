program DSMC
   use class_writer

   call final()

contains
   subroutine final()
      type(Writer) :: wrt_loc

      wrt_loc = Writer("qest.csv")

   end subroutine final

end program DSMC
