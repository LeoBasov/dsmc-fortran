module class_writer
   implicit none
   private

   integer :: unit_module = 1

   type, public :: Writer
      integer, private :: unit_loc
   contains
      final :: destructor
   end type Writer

   interface Writer
      procedure :: constructor
   end interface writer

contains
   function constructor(file_name) result(this)
      character(len=*) :: file_name
      type(Writer) :: this

      this%unit_loc = unit_module
      unit_module = unit_module + 1

      open (unit=this%unit_loc, file=file_name)
   end function constructor

   subroutine destructor(this)
      type(Writer) :: this

      close (this%unit_loc)
   end subroutine destructor
end module class_writer
