program DSMC
   use class_writer

   call final()

contains
   subroutine final()
      type(Writer) :: wrt_loc_1, wrt_loc_2

      wrt_loc_1 = Writer("qest_1.csv")
      wrt_loc_2 = Writer("qest_2.csv")

   end subroutine final

end program DSMC
