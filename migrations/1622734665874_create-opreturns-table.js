/* eslint-disable camelcase */

exports.short_hands = undefined;

exports.up = pgm => {
  pgm.createTable("op_returns", {
    op_return: { type: "text", notNull: true, },
    op_return_hex: { type: "text", notNull: true, },
    transaction_hash: { type: "text", notNull: true, unique: true },
    block_hash: { type: "text", notNull: true },
    block_height: { type: "integer", notNull: true },
  })
};

exports.down = pgm => {
  pgm.dropTable("op_returns")
};
