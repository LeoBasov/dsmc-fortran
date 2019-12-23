module class_writer
   implicit none
   private

   type, public :: Writer
   contains
      final :: destructor
   end type Writer

   interface Writer
      procedure :: constructor
   end interface writer

contains
   function constructor(file_name) result(this)
      character :: file_name
      type(Writer) :: this
   end function constructor

   subroutine destructor(this)
      type(Writer) :: this
   end subroutine destructor
end module class_writer
