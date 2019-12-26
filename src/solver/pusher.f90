module class_pusher
   use class_data
   implicit none

contains
   subroutine push_particles(particles)
      type(data), intent(inout) :: particles

      call push(particles%positions, particles%velocities, particles%time_step)
   end subroutine push_particles

   subroutine push(positions, velocities, time_step)
      real, dimension(:, :), intent(inout) :: positions
      real, dimension(:, :), intent(in) :: velocities
      real, intent(in) :: time_step

      positions = positions + velocities*time_step
   end subroutine push

end module class_pusher
