module class_domain
   use class_cuboid
   use class_data
   implicit none
   private

   type, public :: domain
      type(cuboid) :: cube

   contains
      procedure :: execute => domain_execute
   end type domain

   interface domain
      module procedure domain_constructor_0
   end interface domain

contains
   function domain_constructor_0(x_min, x_max, y_min, y_max, z_min, z_max) result(this)
      type(domain) :: this
      real, intent(in) :: x_min, x_max, y_min, y_max, z_min, z_max

      call this%cube%set(x_min, x_max, y_min, y_max, z_min, z_max)
   end function domain_constructor_0

   subroutine domain_execute(this, particles)
      class(domain), intent(in):: this
      class(data), intent(inout) :: particles
      integer :: i

      do i = 1, particles%get_size()
         if (.not. this%cube%inside(particles%positions(i, 1:3))) then
            ! execute elastic scattering
         end if
      end do
   end subroutine domain_execute

   subroutine domain_initialize(this, particles, particles_size)
      class(domain), intent(in):: this
      class(data), allocatable, intent(out) :: particles
      integer, intent(in) :: particles_size
      integer :: i

      particles = data(particles_size)

      do i = 1, particles_size
         ! initialization
      end do
   end subroutine domain_initialize

end module class_domain
