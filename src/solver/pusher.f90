module class_pusher
   use class_data
   implicit none

contains
   subroutine push_particles(particles)
      type(data), intent(inout) :: particles

      call push(particles%positions, particles%old_positions, particles%velocities, particles%time_step)
   end subroutine push_particles

   subroutine push(positions, old_positions, velocities, time_step)
      real, dimension(:, :), intent(inout) :: positions, old_positions
      real, dimension(:, :), intent(in) :: velocities
      real, intent(in) :: time_step

      old_positions = positions
      positions = positions + velocities*time_step
   end subroutine push

end module class_pusher
