program DSMC
   use class_data

   call final()

contains
   subroutine final()
      type(Data) :: tst

      tst = Data(12)
   end subroutine final

end program DSMC
