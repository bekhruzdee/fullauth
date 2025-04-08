import {
  CanActivate,
  ExecutionContext,
  Injectable,
  UnauthorizedException,
} from '@nestjs/common';

@Injectable()
export class RolesGuard implements CanActivate {
  canActivate(context: ExecutionContext): boolean {
    const request = context.switchToHttp().getRequest();
    const user = request.user;

    if (!user || !user.role) {
      throw new UnauthorizedException(
        'User is not authenticated or role is missing',
      );
    }

    if (user.role !== 'admin') {
      throw new UnauthorizedException('You are not allowed');
    }

    return true;
  }
}
