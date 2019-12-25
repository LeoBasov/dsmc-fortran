module class_data
   implicit none

   type :: Data
      real, dimension(:, :), allocatable :: positions, velocities
      real :: time_step
      integer, private :: data_size
   contains
      final :: data_destructor
      procedure, public :: de_alloc
      procedure, public :: alloc
      procedure, public :: get_size
   end type data

   interface Data
      procedure :: data_constructor
   end interface

contains
   subroutine data_destructor(this)
      type(Data) :: this
      call this%de_alloc
   end subroutine data_destructor

   function data_constructor(size) result(this)
      type(Data) :: this
      integer, intent(in) :: size
      call this%alloc(size)
   end function data_constructor

   subroutine alloc(this, new_size)
      class(Data), intent(out) :: this
      integer, intent(in) :: new_size

      call this%de_alloc
      this%data_size = new_size
      allocate (this%positions(new_size, 3))
      allocate (this%velocities(new_size, 3))
   end subroutine alloc

   subroutine de_alloc(this)
      class(Data) :: this
      if (ALLOCATED(this%positions)) deallocate (this%positions)
      if (ALLOCATED(this%velocities)) deallocate (this%velocities)
   end subroutine de_alloc

   function get_size(this) result(ret_size)
      class(Data), intent(in) :: this
      integer :: ret_size

      ret_size = this%data_size
   end function get_size

end module class_data
