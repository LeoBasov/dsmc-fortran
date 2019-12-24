module class_writer
   use class_data
   implicit none
   private

   integer :: unit_module = 1

   type, public :: Writer
      integer, private :: unit_loc
   contains
      final :: writer_destructor
      procedure :: write_header
      procedure :: write => write_particles
   end type Writer

   interface Writer
      module procedure writer_constructor
   end interface writer

contains
   function writer_constructor(file_name) result(this)
      character(len=*) :: file_name
      type(Writer) :: this

      this%unit_loc = unit_module
      unit_module = unit_module + 1
      open (unit=this%unit_loc, file=file_name)
      call this%write_header
   end function writer_constructor

   subroutine writer_destructor(this)
      type(Writer) :: this

      close (this%unit_loc)
   end subroutine writer_destructor

   subroutine write_header(this)
      class(Writer), intent(in) :: this

      write (this%unit_loc, *) "pos_x, pos_y, pos_z, vel_x, vel_y, vel_z"
   end subroutine write_header

   subroutine write_particles(this, particles)
      class(Writer), intent(in) :: this
      class(Data), intent(out) :: particles

   end subroutine write_particles
end module class_writer
