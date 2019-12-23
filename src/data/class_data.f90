module class_data
   implicit none

   type :: Data
      real, dimension(:, :), allocatable :: positions, velocities
   contains
      final :: destructor
      procedure, public :: de_alloc
      procedure, public :: alloc
   end type data

   interface Data
      procedure :: constructor
   end interface

contains
   subroutine destructor(this)
      type(Data) :: this
      call this%de_alloc
   end subroutine destructor

   function constructor(size) result(this)
      type(Data) :: this
      integer, intent(in) :: size
      call this%alloc(size)
   end function constructor

   subroutine alloc(this, size)
     class(Data), intent(out) :: this
     integer, intent(in) :: size
     if (.not. ALLOCATED(this%positions)) allocate (this%positions(size, 3))
     if (.not.ALLOCATED(this%velocities)) allocate (this%velocities(size, 3))
  end subroutine alloc

   subroutine de_alloc(this)
     class(Data) :: this
     if (ALLOCATED(this%positions)) deallocate (this%positions)
     if (ALLOCATED(this%velocities)) deallocate (this%velocities)
  end subroutine de_alloc

end module class_data
