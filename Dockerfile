# Используем конкретную версию, а не latest
FROM node:18-alpine

# Создаем непривилегированного пользователя
RUN addgroup -g 1001 -S nodejs && \
    adduser -S nodejs -u 1001

# Не храним секреты в образе — используем переменные окружения на этапе запуска
# ENV удалена

WORKDIR /app

COPY app.js .

# Смена владельца
RUN chown -R nodejs:nodejs /app
USER nodejs

EXPOSE 3000

CMD ["node", "app.js"]
