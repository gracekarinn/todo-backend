import { Injectable } from '@nestjs/common';
import { CreateTaskDto } from './dto/create-task.dto';
import { UpdateTaskDto } from './dto/update-task.dto';
import { DatabaseService } from 'src/database/database.service';
import { Prisma } from '@prisma/client';

@Injectable()
export class TaskService {
  constructor(private readonly databaseService: DatabaseService) {}

  async create(createTaskDto: Prisma.TaskCreateInput) {
    return this.databaseService.task.create({
      data: createTaskDto,
    });
  }

  async findAll(userID: string, category?: "Akademik" | "PekerjaanRumah" | "Kepanitaan") {
    if (category)
      return this.databaseService.task.findMany({
        where: {
          category,
          userID,
        },
      });
    return this.databaseService.task.findMany({
      where: {
        userID,
      },
    });
  }

  async findOne(id: string) {
    return this.databaseService.task.findUnique({
      where: {
        id,
      },
    });
  }

  async update(id: string, updateTaskDto: Prisma.TaskUpdateInput) {
    return this.databaseService.task.update({
      where: {
        id,
      },
      data: updateTaskDto,
    });
  }

  async remove(id: string) {
    return this.databaseService.task.delete({
      where: {
        id,
      },
    });
  }
}
