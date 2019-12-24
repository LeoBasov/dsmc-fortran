module class_writer
   implicit none
   private

   integer :: unit_module = 1

   type, public :: Writer
      integer, private :: unit_loc
   contains
      final :: destructor
      procedure :: write_header
   end type Writer

   interface Writer
      module procedure constructor
   end interface writer

contains
   function constructor(file_name) result(this)
      character(len=*) :: file_name
      type(Writer) :: this

      this%unit_loc = unit_module
      unit_module = unit_module + 1
      open (unit=this%unit_loc, file=file_name)
      call this%write_header
   end function constructor

   subroutine destructor(this)
      type(Writer) :: this

      close (this%unit_loc)
   end subroutine destructor

   subroutine write_header(this)
      class(Writer), intent(in) :: this

      write (this%unit_loc, *) "x, y, z"
   end subroutine write_header
end module class_writer
